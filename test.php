<?php
$mysqli = new mysqli("localhost","onno","password","onno");

// Check connection
if ($mysqli -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}

?>
