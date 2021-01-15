<?php

//session_start();
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
                $sqlQuery1 = "SELECT Fire_hazard ,Temperature, Reading_time FROM parking GROUP BY Reading_time DESC LIMIT 1";
                $sqlQuery2 = "SELECT COUNT(ID_spot) AS free_spots FROM parking_spots WHERE State = 'Free'";
                $result1 = $connect->query($sqlQuery1);
                
                $indexdata = $result1->fetch_assoc();

                $temp = $indexdata['Temperature'];
                $fire = $indexdata['Fire_hazard'];
                
                $result1->close();
                
                $result2 = $connect->query($sqlQuery2);
                $indexdata = $result2->fetch_assoc();
                $spots= $indexdata['free_spots'];


                //echo $_SESSION['free_spots'];
            // echo $_SESSION['fire_hazard'];
                //echo $_SESSION['current_temp'];
                $result2->close();
                $connect->close();
            }
            
        }
        catch(Exception $e)
        {
            echo '<span style="color:red;">Server Error!</span>';
            //echo '<br />Debugg: '.$e;
        }

    echo "Free spots: ".$spots;
    echo "<br />Temperature: ".$temp."&#xb0;C";
    if($fire =="1"){
        echo "<br />Fire alert!";
    }
    elseif($fire == "0"){
        echo "<br />There is no fire hazard";
    }
?>