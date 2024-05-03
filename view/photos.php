<!-- PHOTOS PAGE-->
<section class="image-container">
    <div class="top-image-container basic-width">
        <div class="top-image img-box">
            <h2 class="box-title">A hónap képe</h2>                            
            <img src="./img/<?php print($month_photo['file_name'])?>" alt="A hónap képe" class="selected-photo">
        </div>
        <div class="top-image img-box">
            <h2 class="box-title">A nap képe</h2>
            <img src="./img/<?php print($day_photo['file_name'])?>" alt="A nap képe" class="selected-photo">
        </div>                
    </div>
</section>
<section class="gallery-container basic-width">
    <h2>Legújabb fotók</h2>
    <div class="images-gallery">                
    <?php
        foreach($new_photos as $new_photo){
        $id = $new_photo['id']; 
    ?>
        <div class="img-box">
            <img src="./img/<?php print($new_photo['file_name'])?>" alt="" class="index-photo">
            <div class="img-property">
                <p class="img-title"><?php print($new_photo['title'])?></p>
                <div class="img-datas">
                    <div class="view">
                        <img class="icon" src="./assets/view.png" alt="view">
                        <p class="viewnum"><?php print($new_photo['view_number'])?></p>
                    </div>
                    <div class="like">
                        <img class="icon" src="./assets/like.png" alt="like">
                        <p class="likenum"><?php print($new_photo['like_number'])?></p>
                    </div>
                </div>
            </div>
            <div>
                <?php
                    if(isset($_SESSION['id'])){                      
                ?>
                    <button type="button" class="likebtn" id="<?php print($id)?>">Tetszik</button>
                <?php
                    }
                ?> 
            </div>            
        </div>
    <?php
        }
    ?>                                         
    </div> 
</section>