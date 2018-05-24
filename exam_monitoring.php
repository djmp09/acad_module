<?php
	include("connect.php");
	include("functions.php");
	session_start();
	if(!isset($_SESSION['name'])){
		header("location: ../Registrar_Module/Admission/login.php");
	}
	$refnum = "";
	if(isset($_POST['give'])){
		$exam = $_POST['exam'];
		$studnum = $_POST['studnum'];
		$refnum = pass_gen();
		$person = $_SESSION['name'];
		$sql = "INSERT INTO `exam_monitoring`(personnel, refnum, exam_name, student_number)VALUES('$person','$refnum','$exam','$studnum')";
		$query = mysqli_query($connection, $sql);
		if($query){
			echo "<script>
				alert('REFERENCE NUMBER: ".$refnum."');
			</script>";
		}
	} else if(isset($_POST['take'])){
		$now = date("Y-m-d")." ".date("H:i:s");
		$refnum = $_POST['refnum'];
		$studnum = $_POST['studnum'];
		$sql = "UPDATE `exam_monitoring` SET exam_returned = '$now' WHERE refnum = '$refnum' AND student_number = '$studnum'";
		$query = mysqli_query($connection, $sql);
		if($query){
			$refnum = "";
			echo "<script>
				alert('SUCCESS');
			</script>";
		} 
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>EXAM MONITORING MODULE</title>
<style>
	#Give, #Take {
		display: none;
	}

	#data {
		margin-left: 20%;	
	}
</style>
</head>
<body>
	<?php include("templatemon.html"); ?>
	<div id="body1">
	<input type="button" value="Give" onclick="show(this.value);">
	<input type="button" value="Receive" onclick="show(this.value);">
	<input type="button" value="View" onclick="show(this.value);">
	<div id="Give">
		<form method="POST" action="exam_monitoring.php">
			<table border="1">
				<tr>
					<th colspan="2">EXAM MONITORING MODULE(GIVE)</th>
				</tr>
				<tr>
					<td>Exam name:</td>
					<td><input type="text" name="exam" required="true" style="width:100%;"></td>
				</tr>
				<tr>
					<td>Student number</td>
					<td><input type="text" name="studnum" required="true" style="width:100%;"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" name="give" value="Record" style="width:100%;"></td>
				</tr>
			</table>
		</form>
		<?php if($refnum != ""){echo "REFERENCE NUMBER: ".$refnum;} ?>
	</div>
	<div id="Receive">
		<form method="POST" action="exam_monitoring.php">
			<table border="1">
				<tr>
					<th colspan="2">EXAM MONITORING MODULE(RETURN)</th>
				</tr>
				<tr>
					<td>Reference Number:</td>
					<td><input type="text" name="refnum" required="true" style="width:100%;"></td>
				</tr>
				<tr>
					<td>Student number</td>
					<td><input type="text" name="studnum" required="true" style="width:100%;"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" name="take" value="Record" style="width:100%;"></td>
				</tr>
			</table>
		</form>
		<?php if($refnum != ""){echo "REFERENCE NUMBER: ".$refnum;} ?>
	</div>
	<div id="View" style="display: block;">
		<table border="1">
			<tr>
				<th>Personnel</th>
				<th>REFENCE NUMBER</th>
				<th>Exam Name</th>
				<th>Student Number</th>
				<th>Date Taken</th>
				<th>Date Returned</th>
			</tr>
			<?php
				$sql = "SELECT * FROM `exam_monitoring`";
				$query = mysqli_query($connection, $sql);
				if($query){
					if(mysqli_num_rows($query)>0){
						while($rows = mysqli_fetch_assoc($query)){
							echo "<tr>";
							echo "<td>".$rows['personnel']."</td>";
							echo "<td>".$rows['refnum']."</td>";
							echo "<td>".$rows['exam_name']."</td>";
							echo "<td>".$rows['student_number']."</td>";
							echo "<td>".$rows['exam_taken']."</td>";
							echo "<td>".$rows['exam_returned']."</td>";
							echo "</tr>";
						}
					} else {
						echo "<tr><td colspan='6' align='center'>EMPTY</td></tr>";
					}
				}
			?>
		</table>
	</div>
	</div>
<script>
	function show(x){
		document.getElementById("Give").style.display = "none";
		document.getElementById("Receive").style.display = "none";
		document.getElementById("View").style.display = "none";
		document.getElementById(x).style.display = "block";
	}
</script>
</body>
</html>