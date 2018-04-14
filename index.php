<?php
	include("connect.php");
	session_start();
	if(isset($_POST['submit'])){
		$user = $_POST['user'];
		$pass = $_POST['pass'];
		$sql = "SELECT idnum FROM admin WHERE idnum = '$user' AND password = '$pass'";
		$query = mysqli_query($connection, $sql);
		if(mysqli_num_rows($query)>0){
			$row = mysqli_fetch_assoc($query);
			$_SESSION['name'] = $row['idnum'];
			echo $_SESSION['name'];
			header("Location: academics.php");
		} else {
			echo "ERROR";
		}
	}

?>
<!DOCTYPE html>
<html>
<head>
	<title>LOGIN</title>
	<style>
		#login {
			margin: auto;
		    width: 50%;
		    padding: 10px;
		    margin-top: 50px;
		    margin-left: 40%;
		}

		#wrapper {
			background-color: #8B0000;
		    width: 100%;
		    height: 110px;
		    margin-top: -20px;
		    margin-left: -20px;
		    padding-right: 30px;
		}
	</style>
</head>
<body>	
	<div id="wrapper">    
	    <ul>
	        <label id="tag">CAP COLLEGE FOUNDATION, INC.</label>
	        <a href="index.php"><img src="logo.png" id="logo"></a>
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