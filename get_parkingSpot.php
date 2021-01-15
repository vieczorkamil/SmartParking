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
            $sqlQuery1 = "SELECT State FROM parking_spots";
            $result = $connect->query($sqlQuery1);
            
            $i = 1;

            while($row = $result->fetch_assoc()){
                switch ($row['State']):
                    case 'Free': $parking["spot$i"] = "green"; break;
                    case 'Reserved': $parking["spot$i"] = "yellow"; break;
                    case 'Occupied': $parking["spot$i"] = "red"; break;
                    default: $parking["spot$i"] = "white"; break;
                endswitch;
                $i++;
            }
            
            $result->close();

            //echo $parking['spot1'];
            //echo $parking['spot2'];

            $connect->close(); 
        }
        
    }
    catch(Exception $e)
    {
        echo '<span style="color:red;">Server Error!</span>';
        //echo '<br />Debugg: '.$e;
    }

    echo '<div class="block" style="background: '.$parking['spot1'].'">1</div>';
    echo '<div class="block" style="background: '.$parking['spot2'].'">2</div>';
    echo '<div class="block" style="background: '.$parking['spot3'].'">3</div>';
    echo '<div class="block" style="background: '.$parking['spot4'].'">4</div>';
    echo '<div class="block" style="background: '.$parking['spot5'].'">5</div>';
?>
