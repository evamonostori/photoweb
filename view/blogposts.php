<!-- BLOGPOSTS -->
<?php
    if(!isset($articles[0])){
        $article = $articles;
        unset($articles);
        $articles[0] = $article;
        unset($article);
    } 
?>

<section class="last-post-container basic-width">
    <p class="topic"><?php print($articles[0]['topic_name'])?></p>                
    <h2><?php print($articles[0]['title'])?></h2>
    <p class="author">szerző: <?php print($articles[0]['user_name'])?></p>
    <p class="postdate"><?php print($articles[0]['upload_date'])?></p>       
    <p><?php print($articles[0]['short_content'])?></p>
    <a href="./index.php?blog=<?php print($articles[0]['id']);?>" class="post-link">Tovább >></a>
</section>
<section class="posts-container basic-width">
    <?php
        for($i = 1; $i < count($articles); $i++){          
    ?>
    <div class="post-box">
        <p class="topic"><?php print($articles[$i]['topic_name'])?></p> 
        <h2><?php print($articles[$i]['title'])?></h2>
        <p class="author">szerző: <?php print($articles[$i]['user_name'])?></p>        
        <p class="postdate"><?php print($articles[$i]['upload_date'])?></p>
        <p><?php print($articles[$i]['short_content'])?></p>
        <a href="./index.php?blog=<?php print($articles[$i]['id']);?>" class="post-link">Tovább >></a>
    </div>
    <?php
        }
    ?>                  
</section>