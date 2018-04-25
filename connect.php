<?php
	// $servername = "localhost";
	// $username = "root";
	// $password = "";
	// $dbname = "arvinite_cap";
	$servername = "localhost";
	$username = "arvinite_admin";
	$password = "Password123";
	$dbname = "arvinite_cap";
	date_default_timezone_set("Asia/Manila");
	$connection = new mysqli($servername, $username, $password, $dbname);
	if ($connection->connect_error) {
	    die("Connection failed: " . $connection->connect_error);
	} 
?>