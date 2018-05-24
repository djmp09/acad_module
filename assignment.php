<?php
	include("connect.php");
	include("template.html");
	session_start();
	if(!isset($_SESSION['name'])){
		header("location: ../Registrar_Module/Admission/login.php");
	}
	if(isset($_POST['submit2'])){
		$num = $_POST['num'];
		$subjcode = $_POST['subjcode'];
		$course = $_POST['course'];
		$table = $_POST['table'];
		$prof = "";
		$flag = TRUE;
		for($x=0;$x<$num;$x++){
			$fac = $_POST['prof'][$x];
			$sql = "SELECT fac_num FROM faculty WHERE fac_num = '$fac'";
			$query = mysqli_query($connection, $sql);
			if(mysqli_num_rows($query)>0){
				$prof .= $fac.",";
			} else {
				echo "<script> 
					alert('INVALID FACULTY ID!'); 
					window.location = 'academics.php';
				</script>";
				$flag = FALSE;
			}
		}
		if($flag){
			for($x=1;$x<=$num;$x++){
				$fac = $_POST['prof'][$x-1];
				$sql = "INSERT INTO subj_prof(course, subject_code, class_num, professors) VALUES ('$table', '$subjcode', '$x', '$fac')";
				$query = mysqli_query($connection, $sql);
				if($query){
					$sql = "UPDATE num_prof SET assigned = '1' WHERE subject_code = '$subjcode'";
					$query = mysqli_query($connection, $sql);
					if($query){
						$class = strtolower($subjcode)."_class".$x;
						$sql = "UPDATE `$class` SET professor_id = '$fac'";
						$query = mysqli_query($connection, $sql);
						if(!$query){
							$flag = FALSE;
						} 
					} else {
						echo mysqli_error($connection);
					}
				} else {
					echo mysqli_error($connection);
				}
			}
			if($flag){
				header("Location: academics.php");
			}
		}
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>ASSIGNMENT</title>
</head>
<body>
	<br>
	<table border="1">
		<tr id="head">
			<th>Subject Code</th>
			<th>Subject Name</th>
			<th>Units</th>
			<th>Action</th>
		</tr>
		<?php
			if(isset($_POST['submit'])){
				$num = $_POST['num'];
				$subjcode = $_POST['subjcode'];
				$table = $_POST['table'];
				$course = $_POST['course'];
				if($num > 0){
	              echo "
	                  <script>
	                  var row = document.getElementById('head');";
	              for($x=0;$x<$num;$x++){
	                echo "
	                    var x = row.insertCell(".$x."+3);
	                    x.innerHTML = 'Class ' + ".($x+1).";
	                ";
	              }
	              echo "</script>";
	            }

	            $sql = "SELECT subjectcode, subjectname, units FROM `$table` WHERE subjectcode = '$subjcode'";
	            $query = mysqli_query($connection, $sql);
	            if($query){
	            	if(mysqli_num_rows($query)>0){
	            		$row = mysqli_fetch_assoc($query);
	            		echo "<form method='POST' action='assignment.php'>";
	            		echo "<tr>";
	            		echo "<td>".$row['subjectcode']."</td>";
	            		echo "<td>".$row['subjectname']."</td>";
	            		echo "<td align='center'>".$row['units']."</td>";
	            		for($x=0;$x<$num;$x++){
	            			echo "<td><input type='text' name='prof[]' placeholder='faculty id' required='true'></td>";
	            		}
	            		echo "<input type='hidden' name='num' value='".$num."'>";
	            		echo "<input type='hidden' name='subjcode' value='".$subjcode."'>";
	            		echo "<input type='hidden' name='course' value='".$course."'>";
	            		echo "<input type='hidden' name='table' value='".$table."'>";
	            		echo "<td><input type='submit' name='submit2' value='Submit'></td>";
	            		echo "</tr></form>";
	            	}
	            }
			}
		?>
	</table>
</body>
</html>