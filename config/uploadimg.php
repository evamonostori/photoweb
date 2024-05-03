<?php
require_once('config.php');
session_start();

//IMAGE UPLOAD
if(isset($_FILES['image']) && isset($_POST['title'])){
    
    $imgTitle = $_POST['title'];
    
    //FILE RENAME
    $conn = new mysqli($servername, $username, $password, $dbname); 
    $sqlGetData = "SELECT COUNT(file_name) as db FROM images WHERE user_id = '".$_SESSION['id']."'"; 
    $result = $conn->query($sqlGetData);
    $data = $result -> fetch_assoc();
    $imgNumber = $data['db'] + 1;
    
    $fileName = $_SESSION['id'].'_'.$imgNumber.'.jpg';
    
    //FILE RESIZING
    $size = getimagesize($_FILES['image']['tmp_name']);
    $width = $size[0];
    $height = $size[1];
           
    if($width > $height){
        $newWidth = 1000;
        $ratio = $newWidth/$width;
        $newHeight = $height * $ratio;
    }else {
        $newHeight = 667;
        $ratio = $newHeight/$height;
        $newWidth = $width * $ratio;
    }
    
    $imgFile = imagecreatetruecolor($newWidth, $newHeight);
    $source = imagecreatefromjpeg($_FILES['image']['tmp_name']);
    imagecopyresized($imgFile, $source, 0, 0, 0, 0, $newWidth, $newHeight, $width, $height);
    imagejpeg($imgFile, '../img/'.$fileName);   

    $sqlUploadImg = "INSERT INTO images (title, file_name, view_number, like_number, user_id) VALUE ('".$imgTitle."', '".$fileName."', 0, 0, '".$_SESSION['id']."')";
    $conn->query($sqlUploadImg);
    
    $conn->close();
    
    print('success');
}else{
    print('error');
}
