<?php

    session_start();

    require_once "connect.php";
    
	try 
		{
			$connect = new mysqli($host, $db_user, $db_password, $db_name);
			if ($connect->connect_errno!=0)
			{
				throw new Exception(mysqli_connect_errno());
			}
			else
			{
				$sqlQuery1 = "SELECT State FROM parking_spots";
                $result = $connect->query($sqlQuery1);
                
                $i = 1;

                while($row = $result->fetch_assoc()){
                    switch ($row['State']):
                        case 'Free': $_SESSION["spot$i"] = "green"; break;
                        case 'Reserved': $_SESSION["spot$i"] = "yellow"; break;
                        case 'Occupied': $_SESSION["spot$i"] = "red"; break;
                        default: $_SESSION["spot$i"] = "white"; break;
                    endswitch;
                    $i++;
                }
                
                $result->close();

                echo $_SESSION['spot1'];
                echo $_SESSION['spot2'];

                $connect->close(); 
			}
			
		}
		catch(Exception $e)
		{
			echo '<span style="color:red;">Server Error!</span>';
			//echo '<br />Debugg: '.$e;
		}
?>
