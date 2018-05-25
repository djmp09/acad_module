<?php
	include("connect.php");
	session_start();
	if(!isset($_SESSION['name'])){
		header("location: ../MAINWEB/index.html");
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>GENERATE</title>
</head>
<body>
	<?php include("template.html"); ?>
	<div id="body1">
	<table>
		<tr>
			<td><input type="button" value="CLASS LIST" onclick="clist();" class="rev"></td>
			<td><input type="button" value="LOAD REPORT" onclick="load();" class="rev"></td>
		</tr>
	</table>
	<table>
		<tr>
			<?php
				if(isset($_GET['view'])){
					if($_GET['view'] == "class"){
						$sql = "SELECT class_name FROM `class_subject_count`";
						$query = mysqli_query($connection, $sql);
						if($query){
							if(mysqli_num_rows($query)>0){
								while($rows = mysqli_fetch_assoc($query)){
									echo "<td>";
									echo "<input class='rev' type='button' value='".$rows['class_name']."' onclick='cdisp(this.value);'>";
									echo "</td>";
								}
							}
						}
					} else {
						$sql = "SELECT fac_num FROM `faculty`";
						$query = mysqli_query($connection, $sql);
						if($query){
							if(mysqli_num_rows($query)>0){
								while($rows = mysqli_fetch_assoc($query)){
									echo "<td>";
									echo "<input class='rev' type='button' value='".$rows['fac_num']."' onclick='ldisp(this.value);'>";
									echo "</td>";
								}
							}
						}
					}
				}
			?>
		</tr>
	</table>
	</div>
	<div id="data">
		
	</div>
<script src="jquery-3.3.1.js"></script>
<script>
	var url = window.location.href;
	url = url.substring(0,34);
	function clist(){
		window.location = url + "?view=class";
	}

	function load(){
		window.location = url + "?view=load";
	}

	function cdisp(c){
		$('#data').load('class_list.php?class='+c);
	}

	function ldisp(l){
		$('#data').load('load_list.php?load='+l);
	}
</script>
</body>
</html>