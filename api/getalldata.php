<?php 


include("classes/DataBase.class.php");


$db = DataBase::getInstance();

if(is_object($db)){

			$appl_arr = array();

        	$sqlsel = "SELECT * FROM ".TBL_DATA;
        	$row = $db->executeGrab($sqlsel);
			if(is_array($row)){

				$len = count($row);

				if($len>0){
					

					for($i=0;$i<$len;$i++){

		

						$appl_arr[] = array("IDDATA" => $row[$i]['iddepart'],"FNAME" => $row[$i]['depart_name'],"ADDR" => $row[$i]['addr'],"TUSER" => $row[$i]['typeuser'],);	


					}//end for looping

					echo json_encode($appl_arr);

				}else{
					$appl_arr = array();


					echo json_encode($appl_arr);

				}


			}
     

}


?>
