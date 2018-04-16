<?php
	include("connect.php");
	session_start();
	if(!isset($_SESSION['name'])){
		header("location: index.php");
	}
	if(isset($_POST['submit'])){
		$list = array();
		foreach ($_POST['list'] as $value) {
			$list[] = explode("@", $value);
		}
		$fn = date("Y-m-d");
		$fp = fopen('csv/elearning_csv/'.$fn.'.csv', 'w');
		foreach ($list as $fields) {
		    fputcsv($fp, $fields);
		}
		fclose($fp);
		header("Location: report.php");
	}
?>