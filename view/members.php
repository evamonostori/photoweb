<!-- MEMBERS PAGE-->
<section class="members-container basic-width">
    <table>   
        <tr>
            <th>Név</th>
            <th>Státusz</th>
            <th>Képek száma</th>
            <th>Like-ok száma</th>                  
        </tr>
        <?php
            foreach($members as $member){
        ?>    
            <tr>
                <td><a href="index.php?member=<?php print($member['id']);?>" class="user-link"><?php print($member['user_name'])?></a></td>
                <td><?php print($member['user_level'])?></td>
                <td><?php print($member['photos_number'])?></td>
                <td><?php print($member['likes_number'])?></td>          
            </tr>
        <?php      
            }
        ?>         
    </table>                
</section>