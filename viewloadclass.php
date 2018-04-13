<style>
	/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 5%;
    top: 0;
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
</style>
<span class="close">&times;</span>
<table border="1">
	<tr>
		<th>Student Number</th>
		<th>Student Name</th>
	</tr>
	<?php
		include("connect.php");
		session_start();
		if(!isset($_SESSION['name'])){
			header("location: index.php");
		}
		if(isset($_GET['class'])){
			$class = $_GET['class'];
			$sql = "SELECT $class.student_id, students.studentfname, students.studentmname, students.studentlname FROM `$class`, `students` WHERE $class.student_id = students.studentnum";
			$query = mysqli_query($connection, $sql);
			if($query){
				if(mysqli_num_rows($query)>0){
					while($rows = mysqli_fetch_assoc($query)){
						$name = $rows['studentfname']." ".$rows['studentmname']." ".$rows['studentlname'];
						echo "<tr>";
						echo "<td>".$rows['student_id']."</td>";
						echo "<td>".strtoupper($name)."</td>";
						echo "</tr>";
					}
				} else {
					echo "<tr><td colspan='2' align='center'>EMPTY</td></tr>";
				}
			} else {
				//echo "ERROR:".mysqli_error($connection);
				echo "<tr><td colspan='2' align='center'>EMPTY</td></tr>";
			}
		}
	?>
</table>
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
</script>