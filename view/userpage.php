<!-- USERS PAGE -->
<section class="members-container basic-width">    
    <h2 class="title"><?php print($user[$memberid - 1]['user_name'])?></h2>
    <p class="text"><?php print($user[$memberid - 1]['intro'])?></p>
    <div class="images-gallery">
        <?php
           for($i = 0; $i < count($user); $i++){
            $id = $user[$i]['img_id'];                
        ?>
        <div class="img-box">
            <img src="./img/<?php print($user[$i]['file_name'])?>" alt="" class="index-photo">
            <div class="img-property">
                <p class="img-title"><?php print($user[$i]['title'])?></p>
                <div class="img-datas">
                    <div class="view">
                        <img class="icon" src="./assets/view.png" alt="view">
                        <p class="viewnum"><?php print($user[$i]['view_number'])?></p>
                    </div>
                    <div class="like">
                        <img class="icon" src="./assets/like.png" alt="like">
                        <p class="likenum"><?php print($user[$i]['like_number'])?></p>
                    </div>
                </div>
            </div> 
            <div>
                <?php
                    if(isset($_SESSION['id']) && $memberid !== (int)$_SESSION['id']){
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
    <?php
        if(isset($_SESSION['id']) && $memberid === (int)$_SESSION['id']){
    ?>
        <p class="form-label">Kép feltöltése</p>  
        <form class="uploadimg">
            <div>
                <label for="upload">Fájl kiválasztása:<span>*</span></label>
                <input type="file" name="image" id="image">                
            </div>
            <div>
                <label for="title">Kép címe:</label>
                <input type="text" name="title" id="title">                
            </div>
            <p class="infomsg"><span>*</span>A megengedett fájltípus jpg, a maximum fájlméret 2 MB.</p>
            <p class="errormsg">errormsg</p>          
            <button type="button" class="uploadbtn">Feltöltés</button>
        </form>       
    <?php
        }
    ?>       
</section>