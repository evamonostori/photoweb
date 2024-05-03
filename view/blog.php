<!-- BLOG -->
<nav class="submenu basic-width">
    <?php
        if(isset($_SESSION['level']) && $_SESSION['level'] === 'admin'){
            foreach ($topics as $topic) {                
    ?>
        <a href="index.php?topic=<?php print($topic['id']);?>" class="submenu-btn"><?php print($topic['topic_name']);?></a>
    <?php
            }
       }else{
           for($i = 0; $i < count($topics)-1; $i++){
    ?>
        <a href="index.php?topic=<?php print($topics[$i]['id']);?>" class="submenu-btn"><?php print($topics[$i]['topic_name']);?></a>
    <?php
           }
       }
    ?>        
</nav>
<?php
    if(!isset($topicid) && !isset($blogid) && !isset($year)){
        require_once('blogposts.php');
    }else if(isset($topicid) && $topicid === 3){
        require_once('blogedit.php');
    }else if(isset($topicid)|| isset($year) || isset($month)){
        require_once('blogposts.php');        
    }else{
        require_once('blogpost.php');         
    }  
?>
