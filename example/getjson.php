
<?php

//$r->setOptions(array('lastmodified' => filemtime('local.rss')));
$ip = "113.167.114.91";
$key = "8187891dda738315028e62d0ba394db99edacd7e";
$request = "http://ip-api.com/json/".$ip;
$json = file_get_contents($request);
$obj = json_decode($json);
echo "<br>".$obj->{'as'}."</br>";
echo "<br>".$obj->{'city'}."</br>";
echo "<br>".$obj->{'country'}."</br>";
echo "<br>".$obj->{'countryCode'}."</br>";
echo "<br>".$obj->{'isp'}."</br>";
echo "<br>".$obj->{'lat'}."</br>";
echo "<br>".$obj->{'lon'}."</br>";
echo "<br>".$obj->{'org'}."</br>";
echo "<br>".$obj->{'query'}."</br>";
echo "<br>".$obj->{'region'}."</br>";
echo "<br>".$obj->{'regionName'}."</br>";
echo "<br>".$obj->{'status'}."</br>";
echo "<br>".$obj->{'timezone'}."</br>";
echo "<br>".$obj->{'zip'}."</br>";
?>
