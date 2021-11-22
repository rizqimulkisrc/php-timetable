<?php

date_default_timezone_set('Asia/Jakarta');

$connect = mysqli_connect("localhost","root","","upwork");

$phonenumber = mysqli_real_escape_string($connect, $_GET["Phonenumber"]);

$find = mysqli_query($connect, "select * from user where phone='".$phonenumber."'");

if(mysqli_num_rows($find) > 0){

	$fetch_user = mysqli_fetch_assoc($find);

	$query_timetable = mysqli_query($connect, "select * from timetable where timetable_id='".$fetch_user["timetable_id"]."'");

	if(mysqli_num_rows($query_timetable) > 0){

		$fetch_timetable = mysqli_fetch_assoc($query_timetable);

		if($fetch_timetable["is_limitation_access"] == "n"){
			http_response_code(200);

			echo "Success";
 
		} else if($fetch_timetable["is_limitation_access"] == "y"){

			$json = json_decode($fetch_timetable["timesheet"], true);

			$today = date("l");
			$hour_now = date("H:i");
			$date = date("Y-m-d");
			$date_now = strtotime($date." ".$hour_now.":00");

			$found = false;

			foreach ($json as $key => $value) {
				
				if(strtolower($value["dayname"]) == strtolower($today)){

					$start_time = strtotime($date." ".$value["start_time"].":00");
					$end_time = strtotime($date." ".$value["end_time"].":00");

					if($date_now >= $start_time && $date_now <= $end_time){

						$found = true;

						http_response_code(200);

						echo "Success";
					}

				}

			}

			if(!$found){
				http_response_code(403);

				echo "Forbidden";
			}

		}


	} else {

		http_response_code(404);
		die('Timetable not found');

	}


} else {

	http_response_code(404);
	die('Data Not Found');

}


?>