<?php
	include("connect.php");
	include("functions.php");
	if(isset($_POST['submit'])){
		$verdict = "";
		$id = $_POST['id'];
		$year = date('Y');
		$month = date('F');
		$week = count_week();
		if($_POST['submit'] == "APPROVE"){
			$verdict = "credited";
		}else if($_POST['submit'] == "DISAPPROVE"){
			$verdict = "not credited";
		}
		$sql = "UPDATE `creditedsubject` SET verdict = '$verdict', year = '$year', month = '$month', week = '$week' WHERE id = '$id'";
		$query = mysqli_query($connection, $sql);
		if($query){
			echo "
			<script>
				alert('".$_POST['submit']."D');
			</script>
			";
		}
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>TRANSFER</title>
</head>
<body>
	<?php include("template.html"); ?>
	<table border="1">
		<tr>
			<th>Subject Code</th>
			<th>Subject Name</th>
			<th>Student Number</th>
			<th>Status</th>
			<th>Course</th>
			<th>Major</th>
			<th>Units</th>
			<th>Grade</th>
			<th>Action</th>
		</tr>
		<?php
			$sql = "SELECT * FROM `creditedsubject` WHERE verdict = ''";
			$query = mysqli_query($connection, $sql);
			if($query){
				if(mysqli_num_rows($query)>0){
					while($rows = mysqli_fetch_assoc($query)){
						echo "<form method='POST' action='transfer.php'><tr>";
						echo "<td>".$rows['subjectCode']."</td>";
						echo "<td>".$rows['name']."</td>";
						echo "<td>".$rows['student_number']."</td>";
						echo "<td>".$rows['status']."</td>";
						echo "<td>".$rows['course']."</td>";
						echo "<td>".$rows['major']."</td>";
						echo "<td>".$rows['units']."</td>";
						echo "<td>".$rows['grade']."</td>";
						echo "<td>
								<input type='hidden' name='id' value='".$rows['id']."'>
								<input type='submit' name='submit' value='APPROVE' style='width:100%;'><br>
								<input type='submit' name='submit' value='DISAPPROVE' style='width:100%;'>
							</td>";
						echo "</tr></form>";
					}
				} else {
					echo "<tr><td colspan='9' align='center'>EMPTY</td></tr>";
				}
			}
		?>
	</table>
</body>
</html>