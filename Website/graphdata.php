<?php

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
				//getting sensor data
				$sqlQuery1 = "SELECT Gas_Level ,Temperature, Reading_time FROM parking GROUP BY Reading_time ASC";
				//$sqlQuery2 = "SELECT Gas_Level, time FROM parking GROUP BY time ASC";
				$result = $connect->query($sqlQuery1);
				$data = array();

				foreach ($result as $row) {
					$data[] = $row;
				}
				$result->close();
				$connect->close();

				//outputting json
				echo json_encode($data);

				//$result->close();
				//$connect->close();

			}
			
		}
		catch(Exception $e)
		{
			echo '<span style="color:red;">Server Error!</span>';
			//echo '<br />Debugg: '.$e;
		}
?>