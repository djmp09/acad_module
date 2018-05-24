<?php
	include("connect.php");

	$count = 1;
	$sql = "
	CREATE EVENT backup
	ON SCHEDULE EVERY 5 SECOND
	DO
	SELECT * FROM officials
	INTO OUTFILE 'C:\\xampp\\htdocs\\acad\\backup\\yeah.csv'
	FIELDS ENCLOSED BY '\"' 
	TERMINATED BY ';' 
	ESCAPED BY '\"' 
	LINES TERMINATED BY '\r\n'";

    $query = mysqli_query($connection, $sql);
    if($query){
    	echo "SUCCESS";
    } else {
    	echo "FAIL: ".mysqli_error($connection);
    }
?>