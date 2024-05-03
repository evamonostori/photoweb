//PHOTO GALLERY MODAL JS WITH VIEW AND LIKE BUTTON

const images = document.querySelectorAll('.index-photo');
const modalWrapper = document.createElement('div');
const modalBox = document.createElement('div');
const titleImg = document.createElement('div');
const bigImg = document.createElement('img');
const closeButton = document.createElement('span');
const likeButton = document.querySelectorAll('.likebtn');
const viewnum = document.querySelectorAll('.viewnum');
const likenum = document.querySelectorAll('.likenum');

imgModal();
images.forEach(imgZoomIn);
images.forEach(imgZoomOut);

function imgZoomIn(img) {
    img.addEventListener('mouseover', (event) => {
        event.target.style.transform = 'scale(103%)';
    });
}

function imgZoomOut(img) {
    img.addEventListener('mouseout', (event) => {
        event.target.style.transform = 'scale(100%)';
    });
}

function imgModal(){
    for(let [i, img] of images.entries()){        
        let index = i;
        
        img.addEventListener('click', function () {
            bigImg.setAttribute('src', img.src);
            let fileName = img.src.slice(img.src.lastIndexOf('/') + 1);
            document.body.append(modalWrapper);
            modalWrapper.append(modalBox);
            modalBox.append(bigImg, titleImg, closeButton);
            closeButton.innerText = 'close';
            closeButton.classList.add('material-symbols-outlined', 'close');
            modalWrapper.classList.add('modal-wrapper');
            modalBox.classList.add('modal-box');
            titleImg.classList.add('titleimg');            
            document.body.classList.add('stop');

            let datas = {
                fileData: fileName,
                action: "click"
            };

            let params = {
                method: "POST",
                body: JSON.stringify(datas)
            };
            
            fetch("./config/update.php", params)
                .then(response => response.json())
                .then(data => {
                    viewnum[index].innerText = data['view_number'];                    
                    titleImg.innerText = data['user_name'] + ": " + data['title'];                    
                });
        });
    }
}

closeButton.onclick = function () {
    modalWrapper.remove();
    document.body.classList.remove('stop');
};

if (likeButton !== null) {
   
    likeHandler();
    
    function likeHandler() {       
        for(let [i, btn] of likeButton.entries()){       
        let index = i;
        
            btn.addEventListener('click', function () {
                let fileId = btn.id;
                let datas = {
                    fileData: fileId,
                    action: "like"
                };

                let params = {
                    method: "POST",
                    body: JSON.stringify(datas)
                };

                fetch("./config/update.php", params)
                    .then(response => response.json())
                    .then(data => {
                        console.log(data);
                        likenum[index].innerText = data['like_number'];
                    });
            });
        }
    }
}

//LOGIN JS WITH BASIC FORM TEMPLATE

const loginBtn = document.querySelector('#loginbtn');
const emailRegex = /^[\w_\.-]+@[\w\.-]+\.+[\w]{2,3}$/gi;

const basicFormBox = `
<div class="form-container">
    <div class="form-title">
        <h3>Bejelentkezés</h3>
        <span class="material-symbols-outlined form-closebtn">close</span>
    </div>
    <form class="user-form">
        <div class="user-data" id="useremail">
            <label for="email">Email:</label>      
            <input type="email" name="email" id="email">
        </div>
        <div class="user-data" id="userpwd">
            <label for="pwd">Jelszó:</label>     
            <input type="password" name="pwd" id="pwd">
        </div>
        <p id="errormsg" class="errormsg">errormsg</p>
        <div class="btnbox">
            <button type="button" class="formbtn" id="form-loginbtn">Bejelentkezés</button>
        </div>
    </form>
    <div class="infobox">
        <a href="#" class="link">Elfelejtett a jelszó</a>
        <hr>
        <p>Még nincs fiókod? <a href="#" class="link">Regisztrálj itt!</a></p>
    </div>

</div>
`;

if (loginBtn !== null) {
    loginBtn.onclick = function () {
        document.body.append(modalWrapper);
        modalWrapper.classList.add('modal-wrapper');
        modalWrapper.innerHTML = basicFormBox;
        const formContainer = document.querySelector('.form-container');
        const userForm = document.querySelector('.user-form');
        const formTitle = document.querySelector('.form-title h3');
        const errorMsg = document.querySelector('#errormsg');
        const loginFormBtn = document.querySelector('#form-loginbtn');
        document.body.classList.add('stop');
        closeFormButton = document.querySelector('.form-closebtn');
        closeFormButton.onclick = function () {
            modalWrapper.remove();
            formContainer.remove();
            document.body.classList.remove('stop');
        };

        const email = document.querySelector('#email');
        const pwd = document.querySelector('#pwd');
        let valid;

        loginFormBtn.onclick = function () {

            if (email.value.length === 0 || pwd.value.length === 0) {
                errorMsg.innerText = "Az email cím és jelszó kitöltése kötelező!";
                errorMsg.style.visibility = "visible";
                valid = false;
            } else if (email.value.lenth > 0 && emailRegex.test(email.value) === false) {
                console.log(emailRegex.test(email.value));
                errorMsg.innerText = "Érvénytelen email cím!";
                errorMsg.style.visibility = "visible";
                valid = false;
            } else if (pwd.value.length > 0 && pwd.value.length < 6) {
                errorMsg.innerText = "A jelszó nem megfelelő!";
                errorMsg.style.visibility = "visible";
                valid = false;
            } else {
                valid = true;
            }

            if (valid === true) {
                let userDatas = new FormData(userForm);

                let params = {
                    method: "POST",
                    body: userDatas
                };

                fetch("./config/login.php", params)
                        .then((response) => response.text())

                        .then(function (text) {
                            if (text === 'success') {
                                location.href = 'index.php';
                            } else if (text === 'error') {
                                errorMsg.innerText = "Sikertelen bejelentkezés!";
                                errorMsg.style.visibility = "visible";
                            }
                        });
            }
        };
    };
}

//LOGOUT JS
const logoutBtn = document.querySelector('#logoutbtn');

if (logoutBtn !== null) {
    logoutBtn.onclick = function () {
        document.location = 'logout.php';
    };
}

//IMAGE UPLOAD JS
const imgUploadButton = document.querySelector('.uploadbtn');

if(imgUploadButton !== null){
    imgUploadButton.onclick = function(){
        const uploadImgForm = document.querySelector('.uploadimg');    
        const img = document.querySelector('#image');
        const title = document.querySelector('#title');
        const errorMsg = document.querySelector('.errormsg');

        if(img.files.length === 0 || title.value === ''){
            errorMsg.innerText = "Minden mező kitöltése kötelező!";
            errorMsg.style.visibility = "visible";
        }else if(img.files[0].type !== 'image/jpeg' || img.files[0].size > 2*1024*1024){
            errorMsg.innerText = "A fájl formátuma vagy mérete nem megfelelő.";
            errorMsg.style.visibility = "visible";
        }else{
            let imgDatas = new FormData(uploadImgForm);
            let params = {
                method: "POST",
                body: imgDatas
            };

            fetch("./config/uploadimg.php", params)
                    .then((response) => response.text())

                    .then(function (text) {
                        if (text === 'success') {                               
                            img.value ="";
                            title.value= "";
                            errorMsg.innerText = "";
                        } else if (text === 'error') {
                            errorMsg.innerText = "A fájl feltöltése nem sikerült!";
                            errorMsg.style.visibility = "visible";
                        }
                    });
        }
    };
}

//BLOGPOST SAVE JS
const postSaveButton = document.querySelector('#blogformbtn');

if(postSaveButton !== null){
    postSaveButton.onclick = function(){
        const blogPostForm = document.querySelector('#blogedit'); 
        const articleTitle = document.querySelector('#articletitle');
        const articleText = document.querySelector('#articletext');
        const errorMsg = document.querySelector('.errormsg');

        if(articleTitle.value === "" || articleText.value === ""){
            errorMsg.innerText = "Minden mező kitöltése kötelező!";
            errorMsg.style.visibility = "visible";        
        }else{
            let postDatas = new FormData(blogPostForm);
            console.log(postDatas);
            let params = {
                method: "POST",
                body: postDatas
            };

            fetch("./config/uploadpost.php", params)
                    .then((response) => response.text())

                    .then(function (text) {
                        if (text === 'success') {                               
                            articleTitle.value = '';
                            articleText.value= '';
                        } else if (text === 'error') {
                            errorMsg.innerText = "A blogbejegyzés mentése sikertelen!";
                            errorMsg.style.visibility = "visible";
                        }
                    }); 
        }
    };  
}

//HAMBURGER MENU
const hamburger = document.querySelector('.hamburger-menu');
const menuItems = document.querySelector('.menu');
const menuBtn = document.querySelectorAll('.menu-btn');

const line1 = document.querySelector('.line-1');
const line2 = document.querySelector('.line-2');
const line3 = document.querySelector('.line-3');

hamburger.addEventListener('click', () => {
   menuItems.classList.toggle('active');
   line1.classList.toggle('line-1-active');
   line2.classList.toggle('line-2-active');
   line3.classList.toggle('line-3-active');
    }
);

function closeMenu(btn){
   btn.addEventListener('click', function(){
      menuItems.classList.remove('active');
      line1.classList.remove('line-1-active');
      line2.classList.remove('line-2-active');
      line3.classList.remove('line-3-active');
      }
   );
}

menuBtn.forEach(closeMenu);