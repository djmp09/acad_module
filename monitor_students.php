<?php
	include("connect.php");
	session_start();
	if(!isset($_SESSION['name'])){
		header("location: index.php");
	}
	$status = "active";
	if(isset($_POST['submit'])){
		$status = $_POST['status'];
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>MONITORING STUDENTS</title>
</head>
<body>
	<?php include("templatemon.html"); ?>
	<div id="body1">
	<form method="POST" action="monitor_students.php">
		<select name='status'>
			<option value='active' <?php if(isset($status)){echo ($status == "active")? "selected": "";} ?>>active</option>
			<option value='inactive' <?php if(isset($status)){echo ($status == "inactive")? "selected": "";} ?>>inactive</option>
			<option value='grace period' <?php if(isset($status)){echo ($status == "grace period")? "selected": "";} ?>>grace period</option>
			<option value='lapsed' <?php if(isset($status)){echo ($status == "lapsed")? "selected": "";} ?>>lapsed</option>
		</select>
		<input type="submit" name="submit" value='Show'>
	</form>
	
	<?php
		if($status != ""){
			echo "
				<table border='1'>
					<tr>
						<th colspan='4' align='center'>".strtoupper($status)."</th>
					</tr>
					<tr>
						<th>Student Number</th>
						<th>Course</th>
						<th>Major</th>
						<th>Status</th>
					</tr>
			";
			$sql = "SELECT studentnum, course, major, status FROM `students` WHERE status = '$status'";
			$query = mysqli_query($connection, $sql);
			if($query){
				if(mysqli_num_rows($query)>0){
					while($rows = mysqli_fetch_assoc($query)){
						echo "<tr>";
						echo "<td>".$rows['studentnum']."</td>";
						echo "<td>".$rows['course']."</td>";
						echo "<td>".$rows['major']."</td>";
						echo "<td>".$rows['status']."</td>";
						echo "</tr>";
					}
				} else {
					echo "<tr><td colspan='4' align='center'>EMPTY</td></tr>";
				}
			}
		}
	?>
	</table>
	</div>
</body>
</html>