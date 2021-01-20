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
            $sqlQuery1 = 'SELECT ID_Spot, Reservation_due FROM parking_spots WHERE State= "Reserved"';
            //$sqlQuery2 = "UPDATE parking_spots SET State='Free', Reservation_due=0, ID_Client=NULL WHERE ID_Client =".$_SESSION['ID_client'].";";
            

            $result = $connect->query($sqlQuery1);

            //$i=1;
            $datetime = new DateTime();

            while($row = $result->fetch_assoc()){
                //$reservation_due[$row["ID_Spot"]] = $row["Reservation_due"];
                $reservation_due = $row["Reservation_due"];
                $endtime = DateTime::createFromFormat('Y-m-d H:i:s', $reservation_due);
                if($datetime>$endtime)
                    $connect->query("UPDATE parking_spots SET State='Free', Reservation_due=0, ID_Client=NULL WHERE ID_Spot =".$row["ID_Spot"].";");
                //$i++;
                echo $row["ID_Spot"];
            }

        }
        
    }
    catch(Exception $e)
    {
        echo '<span style="color:red;">Server Error!</span>';
        //echo '<br />Debugg: '.$e;
    }
    ?>
