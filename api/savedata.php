<?php 


include("classes/DataBase.class.php");



date_default_timezone_set('Asia/kuala_lumpur');


/*+++++++++ LIST OF POST fields ++++++++++++*/



$fname = $_POST['fnval'];
$addr = $_POST['addrval'];
$dt = $_POST['dt'];
$tuser = $_POST['tuserval'];
$dep = $_POST['depval'];
$gender = $_POST['genval'];


//fntxt,addrtxt,_dt,_selectedDepart,_selecteduser,selectedRadioTile



$todayDate = date('Y-m-d');



$db = DataBase::getInstance();

if(is_object($db)){

	//$custUniqueID = "CUST_".RandomStringUtils::randomString(7);

$sqlinsreq = "INSERT INTO ".TBL_DATA."(fname,addr,iddepart,typeuser,datesel,gender) VALUES ('".$fname."','".$addr."',".(int)$dep.",'".$tuser."','".$dt."',".(int)$gender.")";

	
	$resinstreq = $db->executeOperation($sqlinsreq);
	
	if($resinstreq){
		
			$arr['msg'] = 1;

        	echo json_encode($arr);	
	}else{
		$arr['msg'] = 0;

        echo json_encode($arr);
	}
	

}


?>