<?php

	include("connect.php");
	include("template.html");
	session_start();
	if(!isset($_SESSION['name'])){
		header("location: index.php");
	}
	if(isset($_POST['submit'])){
		$file = $_FILES['csv']['tmp_name'];
		$filename = $_FILES['csv']['name'];
		$path = "C:/xampp/htdocs/acad/csv/".$filename;
		$name = substr($_FILES['csv']['name'], 0, -4);
		$go = 0;
		$target_dir = "csv/".basename($_FILES["csv"]["name"]);
		if (move_uploaded_file($_FILES["csv"]["tmp_name"], $target_dir)) {
	        $go = 1;
	    }
		$sql = "CREATE TABLE `$name` ( `id` INT NOT NULL AUTO_INCREMENT , `subject_code` VARCHAR(99) NOT NULL , `subject_name` VARCHAR(99) NOT NULL , `units` INT NOT NULL , `prereq` VARCHAR(99) NOT NULL , UNIQUE (`id`))";

		$query = mysqli_query($connection, $sql);
		if($query && $go == 1){
			$sql = "LOAD DATA INFILE '$path'
			INTO TABLE `$name`
			FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"'
			LINES TERMINATED BY '\n'
			(
			subject_code,
			subject_name,
			units,
			prereq
			)";

			$query = mysqli_query($connection, $sql);
			if($query){
				echo "<script> alert('SUCCESS!'); </script>";
			} else {
				echo "FAILED<br>";
				echo "ERROR: ".mysqli_error($connection);
			}
		} else {
			echo "FAILED<br>";
			echo "ERROR: ".mysqli_error($connection);
		}
	}

?>
<!DOCTYPE html>
<html>
<head>
	<title>UPLOAD CSV</title>
</head>
<body>
	<div id="body1">
		<form action="" method="post" enctype="multipart/form-data" name="form1" id="form1"> 
			Choose your file: <br /> 
			<input name="csv" type="file" id="csv"/><br> 
			<input type="submit" name="submit" value="submit" /> 
		</form> 
	</div>		
</body>
</html>