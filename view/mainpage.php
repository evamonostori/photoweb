<?php
    session_start();
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />        
        <title>FOTÓPONT</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="stylesheet" href="./assets/style.css"/>   
    </head>
    <body>
        <!-- HEADER -->
        <div class="header">
            <div class="topheader-container">
                <div class="topheader basic-width">
                    <div class="logo">
                        <img src="./assets/logo.png" alt="logo">
                    </div>
                    <div class="adminbox">                     
                        <?php
                            if(isset($_SESSION['id'])){
                        ?>
                        <p class="welcome">Üdvözöllek <?php print($_SESSION['name'])?>!</p>                         
                            <a href="./config/logout.php" class="admin-btn" id="logoutbtn">Kijelentkezés</a>          
                        <?php
                            }else{
                        ?>                            
                            <p class="admin-btn" id="loginbtn">Bejelentkezés</p>                            
                        <?php
                            }                        
                        ?>                          
                    </div>
                </div>
            </div>
            <div class="hamburger-menu">
                <div class="line-1"></div>
                <div class="line-2"></div>
                <div class="line-3"></div>
            </div>
            <nav class="menu basic-width">     
                <?php
                foreach ($menu as $menuitem) {
                ?>
                    <a href="index.php?menuitem=<?php print($menuitem['id'])?>" class="menu-btn"><?php print($menuitem['name'])?></a>
                <?php
                }
                ?>
                <a href="#footer" class="menu-btn">Kapcsolat</a>                   
            </nav>                
        </div>
        
        <!-- MAIN -->        
        <main id="main">
            <section class="hero-container">
                <div class="title-container basic-width">
                    <div class="titlebox">
                        <h1>FOTÓ<span class="redfont">PONT</span></h1>
                        <?php
                        if(!isset($menuitemid) || $menuitemid === 1 || $menuitemid === 2){
                            print('<h3>hobbifotósok közössége</h3>');
                        }else{
                            print('<h3>hírek a fotózás világából</h3>');
                        }
                        ?>                                                
                    </div>
                </div>
            </section>
            <?php
                if(!isset($memberid) && !isset($topicid) && !isset($blogid) && !isset($year)){
                    if(!isset($menuitemid) || $menuitemid === 1){
                        require_once('photos.php');
                    }else if($menuitemid === 2){
                        require_once('members.php');
                    }else if($menuitemid === 3){
                        require_once('blog.php');   
                    }
                }else if(isset($memberid)){
                    require_once('userpage.php'); 
                }else{
                    require_once('blog.php');                     
                }
            ?>
        </main>
        
        <!-- FOOTER -->        
        <footer id="footer">
            <div class="footer-container basic-width">
                <div class="top-footer">
                    <div class="footer-about">
                        <h4>A weboldalról</h4>
                        <p>A FOTÓPONT weblap elsősorban a hobbifotósok számára nyújt lehetőséget, hogy az általuk készült fényképeket
                          az oldalon publikálják. A tagok galériájának megtekintése mellett, regisztrált felhasználóink értékelhetik
                          az alkotók munkáját. Ezen kívül a blogunk hasznos információt nyújt a fotótechnikai és fényképezési ismeretek
                          terén, tájékoztat kiállításokról és fotóstúráktól is.</p>
                    </div>
                    <div class="footer-contact">
                        <h4>Kapcsolat</h4>
                        <div class="footer-data">
                            <span class="material-symbols-outlined info-icon">
                                pin_drop</span>
                            <p>Szeged</p>
                        </div>
                        <div class="footer-data">
                            <span class="material-symbols-outlined info-icon">
                            call</span>
                            <a href="">+36 11 111-1111</a>
                        </div>
                        <div class="footer-data">
                            <span class="material-symbols-outlined info-icon">
                            mail</span>
                            <a href="">info@fotopont.com</a>
                        </div>
                    </div>
                    <div class="footer-information">
                        <h4>Jogi tájékoztatók</h4>
                        <a href="">Impresszum</a>
                        <a href="">Adatkezelési tájékoztató</a>
                        <a href="">Süti tájékoztató</a>
                    </div>                 
                </div>
                <div class="bottom-footer">
                    <p>Az oldalon megjelent fotók szerzői jogvédelem alatt állnak.<br/>
                    vizsgamunka &#169; 2024 Monostoriné Hrabovszky Éva </p>
                </div>
            </div>            
        </footer>
        <script src="./assets/main.js"></script> 
    </body>
</html>
