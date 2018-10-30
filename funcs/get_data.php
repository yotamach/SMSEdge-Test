<?php 

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
    $servername ='localhost';
    $username = 'root';
    $password = 'greentops2013';
    $dbname = 'test';
    
    require_once('./dataSelector.php');
    
    $uname = $_REQUEST['username'];
    $country = $_REQUEST['country'];
    $startDate = $_REQUEST['startDate'];
    $endDate = $_REQUEST['endDate'];
    $select = new dataSelector($servername, $username, $password, $dbname);

    $usr_id = $select->getUserId($uname);
    $cnt_id = $select->getCountryId($country);
    $res = $select->get_date($startDate,$endDate,$cnt_id,$usr_id);
    echo json_encode($res);
?>