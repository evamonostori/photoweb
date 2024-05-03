<?php

if(!function_exists("getData")){
    
    function getData(String $sql){
        require('config.php');
        $conn = new mysqli($servername, $username, $password, $dbname);
        $result = $conn->query($sql);        

        $data = [];
        if ($result->num_rows === 1) {
            $data = $result->fetch_assoc();
        }else if($result->num_rows > 1){
            while($row = $result->fetch_assoc()){
                $data[] = $row;
            }
        }
        
        $conn->close();
        return $data;        
    }
};