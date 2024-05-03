<?php

function monthName(int $month):string{
    switch ($month) {
    case 1:
        $month = 'január';
        break;
    case 2:
        $month = 'február';
        break;
    case 3:
        $month = 'március';
        break;
    case 4:
        $month = 'április';
        break;
    case 5:
        $month = 'május';
        break;
    case 6:
        $month = 'június';
        break;
    case 7:
        $month = 'július';
        break;
    case 8:
        $month = 'augusztus';
        break;
    case 9:
        $month = 'szeptember';
        break;
    case 10:
        $month = 'október';
        break;
    case 11:
        $month = 'november';
        break;
    case 12:
        $month = 'december';
        break;                    
    }
    return $month;
}
