<?php 
  // MySQL, default port number is 3306
  $servername = "localhost";
  // Database name
  $dbname = "lost&found_db";
  // Database user account
  //$dbuser = "root";
  $dbuser = "group18";
  // Database password
  //$dbpassword = "";
  $dbpassword = "351group18";
  
  // Create connection
  $conn = new mysqli($servername, $dbuser, $dbpassword, $dbname);

  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }
?>