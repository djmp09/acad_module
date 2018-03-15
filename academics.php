<?php
	include("connect.php");
	include("template.html");
	include("functions.php");
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
			$sql = "SELECT subjectcode, subjectname FROM `$table`";
			$query = mysqli_query($con, $sql);
			if(mysqli_num_rows($query)>0){
				while($row = mysqli_fetch_assoc($query)){
					echo "<form method='POST' action='academics.php'>";
					echo "<tr>";
					echo "<td>".$row['subjectcode']."</td>";
					echo "<td>".$row['subjectname']."</td>";
					echo "<td><input type='number'></td>";
					echo "<input type='hidden' name='subjcode' value='".$row['subjectcode']."'>";
					echo "<td><input type='submit' name='submit' value='submit'></td>";
					echo "</tr></form>";
				}
			}
			echo "</table>";
			}
		?>
	</div>
</body>
</html>