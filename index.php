<?php
require_once('.'.DIRECTORY_SEPARATOR.'model'.DIRECTORY_SEPARATOR.'dbmodel.php');

$menu = getMenu();
$topics = getTopic();
$archives = getYearMonthCount();

if(isset($_GET['menuitem'])){
    $menuitemid = (int)$_GET['menuitem'];
}else if(isset($_GET['member'])){
    $memberid = (int)$_GET['member'];
}else if(isset($_GET['topic'])){
    $topicid = (int)$_GET['topic'];
}else if(isset($_GET['blog'])){
     $blogid = (int)$_GET['blog'];       
}else if(isset($_GET['year']) && isset($_GET['month'])){
     $year = (int)$_GET['year'];
     $month = (int)$_GET['month']; 
}

if(!isset($menuitemid) || $menuitemid === 1){
    $month_photo = photoOfTheMonth();
    $day_photo = photoOfTheDay();
    $new_photos = newPhotos(); 
}else if($menuitemid === 2){
    $members = addMembers();
}

if(isset($memberid)){
   $user = userDatas($memberid);
}

if(!isset($topicid) && !isset($blogid) && !isset($year)){
    $articles = getAllArticle();
}else if(isset($topicid)){
    $articles = getArticleByTopicId($topicid);
}else if(isset($year) && isset($month)){
    $articles = getArticleByYearAndMonth($year, $month);
}else if(isset($blogid)){
    $articles = getArticleById($blogid);
}
 
require_once('./view/mainpage.php');