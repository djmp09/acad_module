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

function curr_finder($course, $major){
	$course = substr($course, 23);
	$course = str_replace(' ','',$course);
	$course = strtolower($course);
	$major = str_replace(' ','',$major);
	$major = strtolower($major);
	return ($course."_".$major);
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

function pass_gen(){
	$bytes = openssl_random_pseudo_bytes(3);
	$pwd = bin2hex($bytes);
	return strtoupper($pwd);
}

function count_week() {
	$dtA = new DateTime(getFirstMonday(04,date("Y")));
	$dtB = new DateTime(date("Y-m-d"));
	$count = 0;
	while($dtA <= $dtB){
		date_add($dtA,date_interval_create_from_date_string("7 days"));
		$count++;
	}
	return $count;
}

function getFirstMonday($month = 04,$year) {
	$num = date("w",mktime(0,0,0,$month,1,$year));
	$date = date("Y-m-d");
	if($num==1){
		$date = date("Y-m-d",mktime(0,0,0,$month,1,$year));
	}

	elseif($num>1){
		$date = date("Y-m-d",mktime(0,0,0,$month,1,$year)+(86400*(8-$num)));
	}
	else{
		$date = date("Y-m-d",mktime(0,0,0,$month,1,$year)+(86400*(1-$num)));
	}
	return $date;
}
?>