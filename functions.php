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

function getFirstMonday($month = 04,$year)
{
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

function weekOfMonth($date) {
    // estract date parts
    list($y, $m, $d) = explode('-', date('Y-m-d', strtotime($date)));

    // current week, min 1
    $w = 1;

    // for each day since the start of the month
    for ($i = 1; $i <= $d; ++$i) {
        // if that day was a sunday and is not the first day of month
        if ($i > 1 && date('w', strtotime("$y-$m-$i")) == 0) {
            // increment current week
            ++$w;
        }
    }

    // now return
    return $w;
}

function weeks_in_month($month, $year) {
	// Start of month
	$start = mktime(0, 0, 0, $month, 1, $year);
	// End of month
	$end = mktime(0, 0, 0, $month, date('t', $start), $year);
	// Start week
	$start_week = date('W', $start);
	// End week
	$end_week = date('W', $end);

	if ($end_week < $start_week) { // Month wraps
		//year has 52 weeks
		$weeksInYear = 52;
		//but if leap year, it has 53 weeks
		if($year % 4 == 0) {
			$weeksInYear = 53;
		}
		return (($weeksInYear + $end_week) - $start_week);
	}

	return ($end_week - $start_week);
}
?>