<!DOCTYPE html>
<html>
<head>
	<title>LOAD</title>
</head>
<body>
	<input type="button" onclick="myFunction()" id="print" value="PRINT">
	<table border="1"  class="rev2">
		<tr>
			<th>Course</th>
			<th>Subject Code</th>
			<th>Section</th>
			<th class='rev'>Action</th>
		</tr>
		<?php
			include("connect.php");
			session_start();
			if(!isset($_SESSION['name'])){
				header("location: index.php");
			}
			if(isset($_GET['load'])){
				$prof = $_GET['load'];
				$sql = "SELECT course, subject, section FROM teachersubject WHERE fac_num = '$prof'";
				$query = mysqli_query($connection, $sql);
				if($query){
					if(mysqli_num_rows($query)>0){
						$count = 0;
						while($rows = mysqli_fetch_assoc($query)){
							echo "<tr>";
							echo "<td>".$rows['course']."</td>";
							echo "<td>".strtolower($rows['subject'])."</td>";
							echo "<td>".$rows['section']."</td>";
							echo "<td class='rev'><input onclick='show(".$count.");' type='button' value='View Class'></td>";
							echo"</tr>";
							echo "<input type='hidden' id='class".$count."' value='".strtolower($rows['subject'])."_class".$rows['section']."'";
							$count++;
						}
					}
				}
			}
		?>
	</table>
	<div id="myModal" class="modal">
		
	</div>

<script src="jquery-3.3.1.js"></script>
<script>
	var modal = document.getElementById('myModal');
	var span = document.getElementsByClassName("close")[0];

	span.onclick = function() {
	    modal.style.display = "none";
	}

	window.onclick = function(event) {
	    if (event.target == modal) {
	        modal.style.display = "none";
	    }
	}

	function show(count){
		modal.style.display = "block";
		var code = $('#class'+count).val();
		$('#myModal').load('viewloadclass.php?class='+code);
	}

	function myFunction(){
	    var x = document.getElementById("print");
	    var y = document.getElementsByClassName("rev");
	    x.style.display = "none";
	    for (i = 0; i < y.length; i++) { 
		    y[i].style.display = "none";
		}
	    window.print();
	    window.location.reload(true);
	}
</script>
</body>
</html>