<!-- BLOGPOST -->
<?php
    require_once('./function/months.php');
 ?>
<section class="blogpost-container basic-width">
    <div class="blogpost-box">
        <p class="topic"><?php print($articles['topic_name'])?></p> 
        <h2><?php print($articles['title'])?></h2>
        <p class="author">szerző: <?php print($articles['user_name'])?></p>        
        <p class="postdate"><?php print($articles['upload_date'])?></p>
        <p class="text"><?php print(nl2br($articles['content']))?></p>
    </div>
    <div class="archivum">
        <h3>Archívum</h3>
        <ul>
            <?php
                foreach($archives as $archive){ 
            ?>
                <li><a href="./index.php?year=<?php print($archive['year']); ?>&month=<?php print($archive['month']);?>" class="post-link"><?php print($archive['year'].'. '.monthName($archive['month']).' ('.$archive['count'].')');?></a></li> 
            <?php
                }
            ?>                       
        </ul>
    </div>                    
</section>
