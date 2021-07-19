<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $database_name = "booky";
    $connection = mysqli_connect($servername, $username, $password,$database_name);
    if (!$connection) {
        die("Connection failed: " . mysqli_connect_error());
    }else{
//        echo "<h1>Connected</h1>";
    }
?>