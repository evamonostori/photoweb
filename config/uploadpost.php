<?php
require_once('config.php');
session_start();

//BLOGPOST UPLOAD
if(isset($_POST['topicname']) && isset($_POST['articletitle']) && isset($_POST['articletext'])){
    
    $topicName = $_POST['topicname'];
    $articleTitle =  $_POST['articletitle'];
    $articleText = $_POST['articletext'];
    if(strlen($articleText) > 200){
        $shortText = substr($articleText, 0, strpos($articleText, ' ', 200)).'...';        
    }else{
        $shortText = $articleText;
    }
    
    $conn = new mysqli($servername, $username, $password, $dbname);
    $sqlUploadPost = "INSERT INTO blogpost (title, short_content, content, author_id, topic_id) VALUES('".$articleTitle."', '".$shortText."',  '".$articleText."', '".$_SESSION['id']."', '".$topicName."')";
    $conn->query($sqlUploadPost);
    $conn->close();
    
    print('success');
}else{
    print('error');
}

