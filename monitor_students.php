<?php
	include("connect.php");
	session_start();
	if(!isset($_SESSION['name'])){
		header("location: ../MAINWEB/index.html");
	}
	$status = "active";
	if(isset($_GET['submit'])){
		$status = $_GET['status'];
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
	<form method="GET" action="monitor_students.php">
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
			$sql = "SELECT student_number, course, major, status2 FROM `student_info` WHERE status2 = '$status'";
			$query = mysqli_query($connection, $sql);
			if($query){
				if(mysqli_num_rows($query)>0){
					$num = 10;
					$curr_url = substr($_SERVER['REQUEST_URI'], 0, 26);
					$pages = (int)(mysqli_num_rows($query)/$num);
					$remainder = mysqli_num_rows($query)%$num;
					$last_page = 0;
					if($remainder != 0){
						$pages += 1;
						$last_page = $pages;
					}
					$data = array();
					while($rows = mysqli_fetch_assoc($query)){
						$data[] = $rows['student_number']."@".$rows['course']."@".$rows['major']."@".$rows['status2'];
					}
					$page = 1;
					if(isset($_GET['page'])){
						$page = $_GET['page'];	
					}
					$max = $page*$num;
					$min = $max - $num;
					if($page != $last_page){
						for($x = $min; $x<$max; $x++){
							$datum = explode("@", $data[$x]);
							echo "<tr>";
							echo "<td>".$datum[0]."</td>";
							echo "<td>".$datum[1]."</td>";
							echo "<td>".$datum[2]."</td>";
							echo "<td>".$datum[3]."</td>";
							echo "</tr>";
						}
					} else {
						$count = count($data) - $remainder;
						for($x = $count; $x<count($data); $x++){
							$datum = explode("@", $data[$x]);
							echo "<tr>";
							echo "<td>".$datum[0]."</td>";
							echo "<td>".$datum[1]."</td>";
							echo "<td>".$datum[2]."</td>";
							echo "<td>".$datum[3]."</td>";
							echo "</tr>";
						}						
					}
					echo "<tr><td colspan='4' align='center'>Pages:";
					for($x=1;$x<=$pages;$x++){
						echo "&nbsp;&nbsp;&nbsp;&nbsp;";
						echo "<a href='".$curr_url."?status=".$status."&submit=Show&page=".$x."'>".$x."</a>";
					}
					echo "</td></tr>";
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