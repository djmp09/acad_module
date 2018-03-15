<?php
	include("connect.php");

	if(isset($_POST['submit'])){
		$user = $_POST['user'];
		$pass = $_POST['pass'];
		$sql = "SELECT idnum FROM admin WHERE idnum = '$user' AND password = '$pass'";
		$query = mysqli_query($con, $sql);
		if(mysqli_num_rows($query)>0){
			header("Location: academics.php");
		}
	}

?>
<!DOCTYPE html>
<html>
<head>
	<title>LOGIN</title>
	<link rel="stylesheet" type="text/css" href="navbar.css">
	<style>
		#login {
			margin: auto;
		    width: 50%;
		    padding: 10px;
		    margin-top: 50px;
		    margin-left: 40%;
		}
	</style>
</head>
<body>
	<div id="wrapper">    
	    <ul>
	        <label id="tag">CAP COLLEGE FOUNDATION, INC.</label>
	        <a href="index.php"><img src="logo.png" id="logo"></a>
	        <img src="logout.png" id="logout">
	    </ul>
	</div>
	<div id="login">
		<form method="POST" action="index.php">
		<table border="1">
			<tr>
				<th colspan="2">LOGIN</th>	
			</tr>
			<tr>
				<td>Username:</td>
				<td><input type="text" name="user"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" name="submit" value="LOGIN" style="width:100%;">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>