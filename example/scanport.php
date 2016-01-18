<?php
echo "<h1>Hello Master</h1>";
/*
  Simple TCP connect port scanner in php using fsockopen
*/
 
//avoid warnings like this PHP Warning:  fsockopen(): unable to connect to 192.168.1.2:83 (Connection refused) in /var/www/blog/port_scanner.php on line 10
error_reporting(~E_ALL);
 
$from = 1;
$to = 255;
 
//TCP ports
$host = '192.168.1.10';
 
for($port = $from; $port <= $to ; $port++)
{
  $fp = fsockopen($host , $port);
  if ($fp)
  {
    echo "port $port open \n";
    fclose($fp);
  }  
}