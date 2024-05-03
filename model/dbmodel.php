<?php
require_once('./config/dbconn.php');
require_once('./config/config.php');

//MENU
function getMenu() {
    $sql = "SELECT id, name FROM menu";
    $menu = getData($sql);
    return $menu;
}

//PHOTO OF THE MONTH
function photoOfTheMonth(){
    //I SET THE PHOTO OF THE MONTH BECAUSE THE DATABASE IS NOT UPDATED DAILY
    $sql1 = "UPDATE images set upload_date = DATE_ADD(CURRENT_DATE, INTERVAL -1 MONTH) WHERE id IN (SELECT id FROM (SELECT *, ROW_NUMBER() OVER(ORDER BY upload_date DESC) AS rownum FROM images) AS newtable WHERE newtable.rownum = 3)";
    $conn = new mysqli('localhost', 'root', '', 'photoweb');
    $conn->query($sql1);
    
    //PHOTO OF THE MONTH
    $sql2 = "SELECT id, title, file_name FROM images WHERE (YEAR(upload_date) = YEAR(NOW())) AND (MONTH(upload_date) = MONTH(NOW())-1) ORDER BY like_number/view_number DESC LIMIT 1";  
    $monthphoto = getData($sql2);
    return $monthphoto;
}

//PHOTO OF THE DAY
function photoOfTheDay(){
    //I SET THE PHOTO OF THE DAY BECAUSE THE DATABASE IS NOT UPDATED DAILY
    $sql1 = "UPDATE images set upload_date = DATE_ADD(CURRENT_DATE, INTERVAL -1 DAY) WHERE id IN (SELECT id FROM (SELECT *, ROW_NUMBER() OVER(ORDER BY upload_date DESC) AS rownum FROM images) AS newtable WHERE newtable.rownum = 2)";
    $conn = new mysqli('localhost', 'root', '', 'photoweb');
    $conn->query($sql1);
    
    //PHOTO OF THE DAY
    $sql2 = "SELECT id, title, file_name FROM images WHERE upload_date = DATE_ADD(CURRENT_DATE, INTERVAL -1 DAY) ORDER BY like_number/view_number DESC LIMIT 1";
    $dayphoto = getData($sql2);
    return $dayphoto;    
}

//NEW PHOTOS
function newPhotos(){
    $sql = "SELECT id, title, file_name, view_number, like_number FROM images ORDER BY upload_date DESC LIMIT 10";
    $newphotos = getData($sql);
    return $newphotos;     
}

//TABLE OF MEMBERS
function addMembers(){
    $sql = "SELECT u.id, user_name, user_level, COUNT(i.user_id) as photos_number, SUM(like_number) as likes_number FROM users AS u LEFT JOIN images AS i ON(u.id = i.user_id) GROUP BY(u.id)";
    $members = getData($sql);
    return $members;            
}

//PORTFOLIO OF USERS
function userDatas($id){
    $sql = "SELECT u.id, user_name, intro, i.id as img_id, title, view_number, like_number, file_name FROM users AS u LEFT JOIN images AS i ON(i.user_id = u.id) WHERE u.id ='".$id."'";
    $userdata =  getData($sql);
    return $userdata;
}

//BLOG TOPICS
function getTopic(){
    $sql = "SELECT id, topic_name FROM topic";
    $topic = getData($sql);
    return $topic;    
}

//ALL ARTICLES OF THE BLOG
function getAllArticle() {   
    $sql = "SELECT b.id, title, short_content, content, upload_date, topic_name, user_name FROM blogpost AS b LEFT JOIN topic AS t ON (t.id = b.topic_id) LEFT JOIN users AS u ON (u.id = b.author_id) ORDER BY upload_date DESC";
    $articles = getData($sql);
    return $articles;
}

//BLOG ARTICLES BY TOPICS
function getArticleByTopicId(int $id){ 
    $sql = "SELECT b.id, title, short_content, content, upload_date, topic_name, user_name FROM blogpost AS b LEFT JOIN topic AS t ON (t.id = b.topic_id) LEFT JOIN users AS u ON (u.id = b.author_id) WHERE b.topic_id ='".$id."' ORDER BY upload_date DESC";
    $articles = getData($sql);
    return $articles;
}

//BLOG ARTICLES BY YEAR AND MONTH
function getArticleByYearAndMonth(int $year, int $month) {
    $sql = "SELECT b.id, title, short_content,  content, topic_name, upload_date, topic_name, user_name FROM blogpost AS b LEFT JOIN topic AS t ON (t.id = b.topic_id) LEFT JOIN users AS u ON (u.id = b.author_id) WHERE YEAR(b.upload_date) ='".$year."' AND MONTH(b.upload_date) ='".$month."' ORDER BY upload_date DESC";
    $articles = getData($sql);
    return $articles;
}

//BLOG ARTICLE
function getArticleById(int $blogid) {
    $sql = "SELECT b.id, title, short_content,  content, topic_name, upload_date, topic_name, user_name FROM blogpost AS b LEFT JOIN topic AS t ON (t.id = b.topic_id) LEFT JOIN users AS u ON (u.id = b.author_id) WHERE b.id ='".$blogid."'";
    $articles = getData($sql);
    return $articles;
}

//COUNTER OF ARTICLES BY YEAR AND MONTH
function getYearMonthCount(){ 
    $sql = "SELECT YEAR(upload_date) AS year, MONTH(upload_date) AS month, COUNT(*) AS count FROM blogpost GROUP BY YEAR(upload_date), MONTH(upload_date) ORDER BY year DESC, month DESC";
    $archives = getData($sql);
    return $archives;
}

//LOGIN
function loginUser(string $loginemail){ 
    $sql = "SELECT id, email, password FROM users WHERE email = '".$loginemail."'";
    $loginuser = getData($sql);
    return $loginuser;
}
