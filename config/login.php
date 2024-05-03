<?php
require_once('dbconn.php');
session_start();
$email = '';
$pwd = '';

if(isset($_POST['email']) && isset($_POST['pwd'])){
       
    $email = $_POST['email'];
    $pwd = $_POST['pwd'];
    $error = array('reject' => 'Sikertelen bejelentkezés!');
   
    $sql = "SELECT id, user_name, user_level, email, password FROM users WHERE email = '".$email."'";
    $loginuser = getData($sql);
     
    if($loginuser){
        if(password_verify($pwd, $loginuser['password'])){
            $_SESSION['id'] = $loginuser['id'];
            $_SESSION['name'] = $loginuser['user_name'];
            $_SESSION['level'] = $loginuser['user_level'];            
            $_SESSION['logindate'] = date('yyyy.mm.dd');

            print('success');
        }else{
            print('error');
        }
    }else{    
        print('error');
    } 
}

