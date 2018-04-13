<?php
	include("connect.php");
	include("functions.php");
	session_start();
	if(!isset($_SESSION['name'])){
		header("location: index.php");
	}
	if(isset($_POST['submit'])){
		$subjcode = $_POST['subjcode'];
		$num = $_POST['num'];
		$url = $_POST['url'];
		$sql = "INSERT INTO num_prof(subject_code, num_of_prof) VALUES ('$subjcode', '$num')";
		$query = mysqli_query($connection, $sql);
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
		#assign_table {
			overflow: auto;
			height: 300px;
			width: 475px;
		}

		.modal {
		    display: none; /* Hidden by default */
		    position: fixed; /* Stay in place */
		    z-index: 1; /* Sit on top */
		    left: 0;
		    top: 0;
		    width: 100%; /* Full width */
		    height: 100%; /* Full height */
		    overflow: auto; /* Enable scroll if needed */
		    background-color: rgb(0,0,0); /* Fallback color */
		    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}

		/* Modal Content/Box */
		.modal-content {
		    background-color: #fefefe;
		    margin: 15% auto; /* 15% from the top and centered */
		    padding: 20px;
		    border: 1px solid #888;
		    width: 80%; /* Could be more or less, depending on screen size */
		}

		/* The Close Button */
		.close {
		    color: #aaa;
		    float: right;
		    font-size: 28px;
		    font-weight: bold;
		}

		.close:hover,
		.close:focus {
		    color: black;
		    text-decoration: none;
		    cursor: pointer;
		}
	</style>
</head>
<body>
	<?php include("template.html"); ?>
	<div id="body1">
	<p>Courses:</p>
	<?php
		$curr_url = substr($_SERVER['REQUEST_URI'], 0, 19);
		$sql = "SELECT course FROM admission_course";
		$query = mysqli_query($connection, $sql);
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
			$query = mysqli_query($connection, $sql);
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
							<th colspan='4'>NUMBERING</th>
						</tr>
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
				$sql = "SELECT $table.subjectcode, $table.subjectname FROM `$table` LEFT JOIN `num_prof` ON $table.subjectcode = num_prof.subject_code WHERE num_prof.subject_code IS NULL";
				$query = mysqli_query($connection, $sql);
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
	<div id="assign_table" style="margin-top: -300px; margin-left: 60%;">
		<?php
			if(isset($_GET['major'])){
				echo "
					<table border='1'>
						<tr>
							<th colspan='4'>ASSIGNMENT</th>
						</tr>
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
				$sql = "SELECT $table.subjectcode, $table.subjectname, num_prof.num_of_prof FROM `$table`, num_prof WHERE $table.subjectcode = num_prof.subject_code AND num_prof.assigned = 0";
				$query = mysqli_query($connection, $sql);
				if($query){
					if(mysqli_num_rows($query)>0){
						while($row = mysqli_fetch_assoc($query)){
							echo "<form method='POST' action='assignment.php'>";
							echo "<tr>";
							echo "<td>".$row['subjectcode']."</td>";
							echo "<td>".$row['subjectname']."</td>";
							echo "<td align='center'>".$row['num_of_prof']."</td>";
							echo "<input type='hidden' name='subjcode' value='".$row['subjectcode']."'>";
							echo "<input type='hidden' name='num' value='".$row['num_of_prof']."'>";
							echo "<input type='hidden' name='table' value='".$table."'>";
							echo "<td><input type='submit' name='submit' value='Assign'></td>";
							echo "</tr></form>";
						}
					} else {
						echo "<tr><td colspan='4' align='center'>EMPTY</td></tr>";
					}
					echo "</table>";
				} 
			}
		?>
	</div>
</div>
</body>
</html>