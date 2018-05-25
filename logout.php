<?php
	session_start();
	unset($_SESSION);
	session_destroy();
	session_write_close();
	mysqli_close($con);
	header("location: ../MAINWEB/index.html");
	die;
?>