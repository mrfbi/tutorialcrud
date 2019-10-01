<?php 


include("classes/DataBase.class.php");


$db = DataBase::getInstance();

if(is_object($db)){

			$appl_arr = array();

        	$sqlsel = "SELECT * FROM ".TBL_DEPART;
        	$row = $db->executeGrab($sqlsel);
			if(is_array($row)){

				$len = count($row);

				if($len>0){
					

					for($i=0;$i<$len;$i++){

		

						$appl_arr[] = array("IDDEP" => $row[$i]['iddepart'],"DEPT_NAME" => $row[$i]['depart_name']);	


					}//end for looping

					echo json_encode($appl_arr);

				}else{
					$appl_arr = array();


					echo json_encode($appl_arr);

				}


			}
     

}


?>




