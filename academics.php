<?php
	include("connect.php");
	include("functions.php");
	session_start();
	$common_subs = array();
	if(!isset($_SESSION['name'])){
		header("location: ../Registrar_Module/Admission/login.php");
	}
	if(isset($_POST['submit'])){
		$subjcode = $_POST['subjcode'];
		$num = $_POST['num'];
		$url = $_POST['url'];
		$table2 = $_POST['table'];
		$sql = "INSERT INTO num_prof(course, subject_code, num_of_prof) VALUES ('$table2', '$subjcode', '$num')";
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
			width: 550px;
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
	<?php 
		include("template.html"); 
		$assigned_subs = array();
		$sql = "SELECT subject_code FROM `num_prof`";
		$query = mysqli_query($connection, $sql);
		if($query){
			if(mysqli_num_rows($query)>0){
				while($rows = mysqli_fetch_assoc($query)){
					$assigned_subs[] = $rows['subject_code'];
				}
			}
		}
	?>
	<div id="body1">
		<table border="1">
			<tr>
				<th>COURSES:</th>
			</tr>
				<?php
					$curr_url = substr($_SERVER['REQUEST_URI'], 0, 19);
					$sql = "SELECT DISTINCT course FROM admission_course";
					$query = mysqli_query($connection, $sql);
					if(mysqli_num_rows($query)>0){
						while($row = mysqli_fetch_assoc($query)){
							echo "<tr><td><a href='".$curr_url."?course=".$row['course']."'>".$row['course']."</a></td></tr>";
						}
					}
				?>
		</table>
		<br>
		<?php
			if(isset($_GET['course'])){
				$tables = array();
				$get_course = $_GET['course'];
				$get_course = clean_course($get_course);
				$sql = "SHOW TABLES FROM arvinite_cap LIKE '%".$get_course."%'";
				$query = mysqli_query($connection, $sql);
				if($query){
					if(mysqli_num_rows($query)>0){
						while($row = mysqli_fetch_row($query)){
							$tables[] = $row[0];
						}
					}
				} else {
					echo "ERROR: ".mysqli_error($connection);
				}
				$sql = "SELECT subjectcode FROM `$tables[0]`";
				$query = mysqli_query($connection, $sql);
				$ctr = 0;
				if($query){
					if(mysqli_num_rows($query)>0){
						while($row = mysqli_fetch_assoc($query)){
							$subj_code = $row['subjectcode'];
							for($x=1;$x<count($tables);$x++){
								$sql2 = "SELECT subjectcode FROM `$tables[$x]` WHERE subjectcode = '$subj_code'";
								$query2 = mysqli_query($connection, $sql2);
								if($query2 && mysqli_num_rows($query2)>0){
									$ctr += 1;
									continue;
								} else {
									$ctr = 0;
									break;
								}
							}
							if($ctr == 4){
								$common_subs[] = $subj_code;
								$ctr = 0;
							}
						}
						echo "<table border='1'>
								<tr>
									<th colspan='4'>COMMON SUBJECTS:</th>
								</tr>
								<tr>
									<th>Subject Code</th>
									<th>Subject Name</th>
									<th>Number of Classes</th>
									<th>Action</th>
								</tr>";

						$z = 1;
						$num = 10;
						$curr_url2 = substr($_SERVER['REQUEST_URI'], 0, 83);
						$pages = (int)(count($common_subs)/$num);
						$remainder = count($common_subs)%$num;
						$last_page = 0;
						if($remainder != 0){
							$pages += 1;
							$last_page = $pages;
						}
						$page = 1;
						if(isset($_GET['page'])){
							$page = $_GET['page'];	
						}
						$max = $page*$num;
						$min = $max - $num;
						if($page != $last_page){
							for($x=$min;$x<$max;$x++) {
								$sql = "SELECT subjectname FROM `$tables[0]` WHERE subjectcode = '$common_subs[$x]'";
								$query = mysqli_query($connection, $sql);
								if($query){
									$row = mysqli_fetch_assoc($query);
									if(!in_array($common_subs[$x], $assigned_subs)){
										echo "<form method='POST' action='academics.php'>";
										echo "<tr>";
										echo "<td>".$common_subs[$x]."</td>";
										echo "<td>".$row['subjectname']."</td>";
										echo "<td><input type='number' name='num' required='true'></td>";
										echo "<input type='hidden' name='subjcode' value='".$common_subs[$x]."'>";
										echo "<input type='hidden' name='url' value='".$_SERVER['REQUEST_URI']."'>";
										echo "<input type='hidden' name='table' value='GEBSBA'>";
										echo "<td><input type='submit' name='submit' value='submit'></td>";
										echo "</tr></form>";
									}
								}
							}
						} else {
							$count = count($common_subs) - $remainder;
							for($x=$count;$x<count($common_subs);$x++) {
								echo "<tr>";
								echo "<td>".$common_subs[$x]."</td>";
								echo "</tr>";
							}
						}
						echo "<tr><td colspan='4' align='center'>Pages:";
						for($x=1;$x<=$pages;$x++){
							echo "&nbsp;&nbsp;&nbsp;&nbsp;";
							echo "<a href='".$curr_url2."&page=".$x."'>".$x."</a>";
						}
						echo "</td></tr>";
						echo "</table>";
					}
				}
			}
		?>
		<br>
		<?php
			if(isset($_GET['course'])){
				$get_course = $_GET['course'];
				$sql = "SELECT major FROM admission_course WHERE course = '$get_course'";
				$query = mysqli_query($connection, $sql);
				if(mysqli_num_rows($query)>0){
					echo '<table border="1">
							<tr>
								<th>MAJORS:</th>
							</tr>';
					while($row = mysqli_fetch_assoc($query)){
						echo "<tr><td><a href='".$curr_url."?course=".$get_course."&major=".$row['major']."'>".$row['major']."</a></td></tr>";
					}
					echo "</table>";
				}
			}
		?>
	</div>
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
							<th>Number of Classes</th>
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
							if(!in_array($row['subjectcode'], $common_subs)){
								echo "<form method='POST' action='academics.php'>";
								echo "<tr>";
								echo "<td>".$row['subjectcode']."</td>";
								echo "<td>".$row['subjectname']."</td>";
								echo "<td><input type='number' name='num' required='true'></td>";
								echo "<input type='hidden' name='subjcode' value='".$row['subjectcode']."'>";
								echo "<input type='hidden' name='url' value='".$_SERVER['REQUEST_URI']."'>";
								echo "<input type='hidden' name='table' value='".$table."'>";
								echo "<td><input type='submit' name='submit' value='submit'></td>";
								echo "</tr></form>";
							}
						}
					}
					echo "</table>";
				} else {
					echo "<tr><td colspan='4' align='center'>EMPTY</td></tr>";
				}
			}
		?>
	</div>
	<div id="assign_table" style="margin-top: -300px; margin-left: 50%;">
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
							<th>Number of Classes</th>
							<th>Action</th>
						</tr>
				";
				$get_course = $_GET['course'];
				$get_major = $_GET['major'];
				$table = clean_course($get_course)."_".clean_major($get_major);
				$sql = "SELECT $table.subjectcode, $table.subjectname, num_prof.num_of_prof FROM `$table`, num_prof WHERE $table.subjectcode = num_prof.subject_code AND num_prof.assigned = 0 AND num_prof.course = '$table' OR num_prof.course = 'GEBSBA'";
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
							echo "<input type='hidden' name='course' value='".$get_course."'>";
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