<?php
	include("connect.php");
	session_start();
		if(!isset($_SESSION['name'])){
			header("location: index.php");
		}
	$month = "";
	$year = "";
	$week = "";
	if(isset($_POST['submit'])){
		$month = $_POST['month'];
		$year = $_POST['year'];
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>CREDIT EVAL REPORT</title>
</head>
<body>
	<?php include("template.html"); ?>
	<div id="body1">
	<form method="POST" action="creditreport.php">
		<?php
			$months = array("April", "May", "June", "July", "August", "September", "October", "November", "December", "January", "February", "March");
			echo "<select name='year'>";
			for($x=2018;$x<=date('Y');$x++){
				echo "<option value='".$x."' ";
				if(isset($year)){echo ($x == $year)? "selected": "";}
				echo ">".$x."</option>";
			}
			echo "</select>&nbsp;&nbsp;";
			echo "<select name='month'>";
			for($x=0;$x<count($months);$x++){
				echo "<option value='".$months[$x]."' ";
				if(isset($month)){echo ($months[$x] == $month)? "selected": "";}
				echo ">".$months[$x]."</option>";
			}

			echo "</select>";
			
		?>
		<input type="submit" name="submit" value="Search">
		</form>
	<form method="POST" action="creditreport.php">
		<?php
			if(isset($_POST['submit']) OR $week != ""){
				$sql = "SELECT DISTINCT(week) FROM `creditedsubject` WHERE year = '$year' AND month = '$month'";
				$query = mysqli_query($connection, $sql);
				if($query){
					if(mysqli_num_rows($query)>0){
						echo "<select name='week'>";
						while($rows = mysqli_fetch_assoc($query)){
							echo "<option value='".$rows['week']."' ";
							if(isset($rows['week'])){echo ($rows['week'] == $week)? "selected": "";}
							echo ">".$rows['week']."</option>";
						}
						echo "</select>&nbsp;";
						echo "<input type='hidden' name='year' value='".$year."'>";
						echo "<input type='hidden' name='month' value='".$month."'>";
					}
				}
				if(mysqli_num_rows($query)>0){
					echo '<input type="submit" name="submit2" value="Show">';
				} else {
					echo "NO AVAILABLE REPORT";
				}
			}
		?>
	</form>
	</div>
	<div id="data"></div>
	<script src="jquery-3.3.1.js"></script>
	<script>
		function load(a, b, c){
			$('#data').load('creditreportgen.php?year='+a+'&month='+b+'&week='+c);
		}
	</script>
	<?php

		if(isset($_POST['submit2'])){
			$month = $_POST['month'];
			$year = $_POST['year'];
			$week = $_POST['week'];
			echo "<script>load('".$year."','".$month."','".$week."');</script>";
		}

	?>
</body>
</html>