<?php
	include("connect.php");
	session_start();
	if(!isset($_SESSION['name'])){
		header("location: ../Registrar_Module/Admission/login.php");
	}
?>
<br><br>
<table border="1">
	<tr>
		<th>Student Number</th>
		<th>Course</th>
		<th>Subject Code</th>
	</tr>
	<?php
		if(isset($_GET['year'])){
			$year = $_GET['year'];
			$month = $_GET['month'];
			$week = $_GET['week'];
			$sql = "SELECT subjectCode, course, student_number FROM `creditedsubject` WHERE year = '$year' AND month = '$month' AND week = '$week' AND verdict != 'not credited'";
			$query = mysqli_query($connection, $sql);
			if($query){
				if(mysqli_num_rows($query)>0){
					while($rows = mysqli_fetch_assoc($query)){
						echo "<tr>";
						echo "<td>".$rows['student_number']."</td>";
						echo "<td>".$rows['course']."</td>";
						echo "<td>".$rows['subjectCode']."</td>";
						echo "</tr>";
					}
				}
			} 
		}
	?>
</table>