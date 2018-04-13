<?php
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "sms";
	date_default_timezone_set("Asia/Manila");
	$connection = new mysqli($servername, $username, $password, $dbname);
	if ($connection->connect_error) {
	    die("Connection failed: " . $connection->connect_error);
	} 
?>