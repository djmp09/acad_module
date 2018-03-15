<?php
function clean_course($course){
	$index = strpos($course, "in")+3;
	$course = substr($course, $index);
	$course = str_replace(' ','',$course);
	$course = strtolower($course);
	return $course;
}
function clean_major($major){
	$major = str_replace(' ','',$major);
	$major = strtolower($major);
	return $major;
}

function sy_gen(){
	$dog = getdate();
	$sy = "";
	if (($dog['mon'] == "5")||($dog['mon'] == "6")||($dog['mon'] == "7")||($dog['mon'] == "8"))
	{
	    $sy .= '1-'.$dog['year'];
		$sy .= '-'.$dog['year']-1;
	}
	elseif (($dog['mon'] == "9")||($dog['mon'] == "10")||($dog['mon'] == "11")||($dog['mon'] == "12")) 
	{
	    $sy .= '2-'.$dog['year'];
	    $sy .='-'.$dog['year']-1;
	}
	else if(($dog['mon'] == "1")||($dog['mon'] == "2")||($dog['mon'] == "3")||($dog['mon'] == "4")) 
	{
		$sy .= '3-'.$dog['year'];
		$sy .= '-'.$dog['year']-1;
	}

	return $sy;
}

function ave($score, $items){
	return round(((int)$score/(int)$items)*100);
}

?>