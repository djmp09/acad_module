<?php
	session_start();
	include("connect.php");
	include("templaterep.html");
	if(!isset($_SESSION['name'])){
		header("location: ../MAINWEB/index.html");
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>REPORT</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>OR Number</th>
			<th>Date</th>
			<th>Transaction Number</th>
			<th>Subject/s</th>
		</tr>
		<?php
			$sql = "SELECT * FROM accounting WHERE status = 1";
			$query = mysqli_query($connection, $sql);
			$list = array();
			$row = array();
			if($query){
				if(mysqli_num_rows($query)){
					while($rows = mysqli_fetch_assoc($query)){
						echo "<tr>";
						echo "<td>".$rows['ORnumber']."</td>";
						echo "<td>".$rows['dateaccepted']."</td>";
						echo "<td>".$rows['TransactionNumber']."</td>";
						echo "<td>".$rows['SubjectPaid']."</td>";
						echo "</tr>";
						$row[] = $rows['ORnumber'];
						$row[] = $rows['dateaccepted'];
						$row[] = $rows['TransactionNumber'];
						$row[] = $rows['SubjectPaid'];
						$list[] = $row;
						$row = array();
					}
				}
			}
		?>
	</table>
	<form method="POST" action="mkcsv.php">
		<?php
			foreach($list as $value)
			{
				$value = implode("@", $value);
			 	echo '<input type="hidden" name="list[]" value="'. $value. '">';
			}
		?>
		<input type="submit" name="submit" value="Create CSV">
	</form>
	<?php
		if(isset($_GET['download'])){
			echo "<button><a href='csv/elearning_csv/".date("Y-m-d").".csv' download>Download </a></button>";
		}
	?>
</body>
</html>