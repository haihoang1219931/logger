<?php
	include "db.php";
	if (isset($_GET["key"])){
		$key = $_GET["key"];
		$sql = "SELECT str_command,is_executed FROM `commands` WHERE `key`='".$key."'";
		
		$result = $conn->query($sql);
		if ($result->num_rows > 0) {
			while($row = $result->fetch_row()){
				echo "<p>";
				echo $row[0];
				echo ":";
				echo $row[1];
				echo "</p>";
				//$sql = "UPDATE `commands` SET is_executed=0 WHERE `key`='".$key."'";
				//$conn->query($sql);
			}
		} else {
		    echo "None";
		}
	};
	$conn->close();

?>