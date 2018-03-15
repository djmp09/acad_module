<?php
	include("connect.php");
	include("template.html");
	include("functions.php");

	if(isset($_POST['submit'])){
		$subjcode = $_POST['subjcode'];
		$num = $_POST['num'];
		$url = $_POST['url'];
		$sql = "INSERT INTO subject_prof(subject_code, num_of_prof) VALUES ('$subjcode', '$num')";
		$query = mysqli_query($con, $sql);
		if($query){
			header("Location: ".$url);
		}
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>ACADEMICS</title>
	<style>
		#subj_table {
			overflow: auto;
			height: 300px;
			width: 620px;
		}
	</style>
</head>
<body>
	<p>Courses:</p>
	<?php
		$curr_url = substr($_SERVER['REQUEST_URI'], 0, 19);
		$sql = "SELECT course FROM admission_course";
		$query = mysqli_query($con, $sql);
		if(mysqli_num_rows($query)>0){
			while($row = mysqli_fetch_assoc($query)){
				echo "<a href='".$curr_url."?course=".$row['course']."'>".$row['course']."</a><br>";
			}
		}
	?>
	<br>
	<p>Majors:</p>
	<?php
		if(isset($_GET['course'])){
			$get_course = $_GET['course'];
			$sql = "SELECT major FROM admission_course WHERE course = '$get_course'";
			$query = mysqli_query($con, $sql);
			if(mysqli_num_rows($query)>0){
				while($row = mysqli_fetch_assoc($query)){
					echo "<a href='".$curr_url."?course=".$get_course."&major=".$row['major']."'>".$row['major']."</a><br>";
				}
			}
		}
	?>
	<br>
	<div id="subj_table">
		<?php
			if(isset($_GET['major'])){
				echo "
					<table border='1'>
						<tr>
							<th>Subject Code</th>
							<th>Subject Name</th>
							<th>Number</th>
							<th>Action</th>
						</tr>
				";
				$get_course = $_GET['course'];
				$get_major = $_GET['major'];
				$table = clean_course($get_course)."_".clean_major($get_major);
				$sql = "SELECT $table.subjectcode, $table.subjectname FROM `$table` LEFT JOIN `subject_prof` ON $table.subjectcode = subject_prof.subject_code WHERE subject_prof.subject_code IS NULL";
				$query = mysqli_query($con, $sql);
				// "SELECT participants.event_id, participants.student_number, participants.first_name, participants.middle_name, participants.last_name, participants.section FROM participants LEFT JOIN attendance ON attendance.event_id = participants.event_id WHERE attendance.event_id IS NULL"
				if($query){
					if(mysqli_num_rows($query)>0){
						while($row = mysqli_fetch_assoc($query)){
							echo "<form method='POST' action='academics.php'>";
							echo "<tr>";
							echo "<td>".$row['subjectcode']."</td>";
							echo "<td>".$row['subjectname']."</td>";
							echo "<td><input type='number' name='num' required='true'></td>";
							echo "<input type='hidden' name='subjcode' value='".$row['subjectcode']."'>";
							echo "<input type='hidden' name='url' value='".$_SERVER['REQUEST_URI']."'>";
							echo "<td><input type='submit' name='submit' value='submit'></td>";
							echo "</tr></form>";
						}
					}
					echo "</table>";
				} else {
					echo "<tr><td colspan='4' align='center'>EMPTY</td></tr>";
				}
			}
		?>
	</div>
</body>
</html>