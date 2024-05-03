<!-- BLOG EDITOR FORM -->
<section class="basic-width">
    <form id="blogedit">
        <p>Téma:</p>         
        <div>  
            <input type="radio" name="topicname" id="topicname1" value="1" checked>
            <label for="topicname">Fotózás</label>
        </div>
        <div>        
            <input type="radio" name="topicname" id="topicname2" value="2">
            <label for="topicname">Események</label>              
        </div>
        <label for="articletitle">Cím:</label>
        <input type="text" name="articletitle" id="articletitle">            
        <label for="articletext">Tartalom:</label>
        <textarea name="articletext" id="articletext" rows="10"></textarea>
        <p class="errormsg editerror">errormsg</p> 
        <div class="btnbox">
            <button type="button" class="formbtn" id="blogformbtn">Mentés</button>
        </div>
    </form>
</section>    
