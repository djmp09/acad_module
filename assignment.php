<?php
	include("connect.php");
	include("template.html");

	if(isset($_POST['submit2'])){
		$num = $_POST['num'];
		$subjcode = $_POST['subjcode'];
		$prof = "";
		for($x=0;$x<$num;$x++){
			$prof .= $_POST['prof'][$x].",";
		}
		$sql = "INSERT INTO subj_prof(subject_code, professors) VALUES ('$subjcode','$prof')";
		$query = mysqli_query($con, $sql);
		if($query){
			header("Location: academics.php");
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
				if($num > 0){
	              echo "
	                  <script>
	                  var row = document.getElementById('head');";
	              for($x=0;$x<$num;$x++){
	                echo "
	                    var x = row.insertCell(".$x."+3);
	                    x.innerHTML = 'Professor ' + ".($x+1).";
	                ";
	              }
	              echo "</script>";
	            }

	            $sql = "SELECT subjectcode, subjectname, units FROM `$table` WHERE subjectcode = '$subjcode'";
	            $query = mysqli_query($con, $sql);
	            if($query){
	            	if(mysqli_num_rows($query)>0){
	            		$row = mysqli_fetch_assoc($query);
	            		echo "<form method='POST' action='assignment.php'>";
	            		echo "<tr>";
	            		echo "<td>".$row['subjectcode']."</td>";
	            		echo "<td>".$row['subjectname']."</td>";
	            		echo "<td align='center'>".$row['units']."</td>";
	            		for($x=0;$x<$num;$x++){
	            			echo "<td><input type='text' name='prof[]' placeholder='Name'></td>";
	            		}
	            		echo "<input type='hidden' name='num' value='".$num."'>";
	            		echo "<input type='hidden' name='subjcode' value='".$subjcode."'>";
	            		echo "<td><input type='submit' name='submit2' value='Submit'></td>";
	            		echo "</tr></form>";
	            	}
	            }
			}
		?>
	</table>
</body>
</html>