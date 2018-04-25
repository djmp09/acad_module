<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<input type="button" onclick="myFunction()" id="print" value="PRINT">
	<table border="1">
		<tr>
			<th>Student Number</th>
			<th>Student Name</th>
		</tr>
		<?php
			include("connect.php");
			session_start();
			if(!isset($_SESSION['name'])){
				header("location: ../Registrar_Module/Admission/login.php");
			}
			if(isset($_GET['class'])){
				$class = $_GET['class'];
				$sql = "SELECT $class.student_id, students.studentfname, students.studentmname, students.studentlname FROM `$class`, `students` WHERE $class.student_id = students.studentnum";
				$query = mysqli_query($connection, $sql);
				if($query){
					if(mysqli_num_rows($query)>0){
						while($rows = mysqli_fetch_assoc($query)){
							$name = $rows['studentfname']." ".$rows['studentmname']." ".$rows['studentlname'];
							echo "<tr>";
							echo "<td>".$rows['student_id']."</td>";
							echo "<td>".strtoupper($name)."</td>";
							echo "</tr>";
						}
					} else {
						echo "<tr><td colspan='2' align='center'>EMPTY</td></tr>";
					}
				} else {
					echo "ERROR:".mysqli_error($connection);
				}
			}
		?>
	</table>
<script>
	function myFunction(){
	    var x = document.getElementById("print");
	    var y = document.getElementsByClassName("rev");
	    x.style.display = "none";
	    for (i = 0; i < y.length; i++) { 
		    y[i].style.display = "none";
		}
	    window.print();
	    window.location.reload(true);
	}
</script>
</body>
</html>