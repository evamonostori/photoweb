<?php
require_once('config.php');

//IMAGE  VIEW AND LIKE PROPERTY UPDATE
$json = file_get_contents('php://input');
$sendDatas = json_decode($json); 
$file = $sendDatas->fileData;
$char = substr($file, 0,1);
$data = '';

$conn = new mysqli($servername, $username, $password, $dbname);    
if ($sendDatas->action === "click"){
    $sqlUpdate = "UPDATE images SET view_number = view_number + 1 WHERE file_name = '".$file."'";  
    $conn->query($sqlUpdate);  

    $sqlGetData = "SELECT user_name, title, view_number FROM images AS i LEFT JOIN users AS u ON(u.id = '".$char."') WHERE file_name = '".$file."'";  
    $result = $conn->query($sqlGetData);
    $data = $result->fetch_assoc();        
  
    print(json_encode($data));   
}

if ($sendDatas->action === "like"){
    $sqlUpdate = "UPDATE images SET like_number = like_number + 1 WHERE id = '".$file."'";  
    $conn->query($sqlUpdate);  

    $sqlGetData = "SELECT like_number FROM images WHERE id = '".$file."'";  
    $result = $conn->query($sqlGetData);
    $data = $result->fetch_assoc();        
       
    print(json_encode($data));  
}

$conn->close(); 