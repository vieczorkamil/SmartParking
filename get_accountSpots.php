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
            $sqlQuery1 = "SELECT * FROM clients WHERE ID_Client =".$_SESSION['ID_client'].";";
            $sqlQuery2 = "SELECT ID_Spot, Reservation_due FROM parking_spots WHERE ID_client =".$_SESSION['ID_client'].";";
            $sqlQuery3 = "UPDATE parking_spots SET State='Free', Reservation_due=0, ID_Client=NULL WHERE ID_Client =".$_SESSION['ID_client'].";";
            
            $result = $connect->query($sqlQuery1);
            $row = $result->fetch_assoc();

            $name = $row['Name'];
            $surname = $row['Surname'];
            $nick = $row['Nick'];
            $email = $row['Email'];
            $phone = $row['Phone'];
            $datetime = new DateTime();

            $result->close();

            $result = $connect->query($sqlQuery2);
            $row = $result->fetch_assoc();

            if(isset($row['ID_Spot']))
                $ID_spot = $row['ID_Spot'];
            else
                $ID_spot = "None";
            if(isset($row['Reservation_due'])){
                $duetime = $row['Reservation_due'];

                $endtime = DateTime::createFromFormat('Y-m-d H:i:s', $duetime);

                if($datetime>$endtime)
                    $connect->query($sqlQuery3);
                
                $_SESSION['Duetime'] = $duetime;
            }
            else
                $duetime = "No reservation";

            $result->close();
            $connect->close();

        }
        
    }
    catch(Exception $e)
    {
        echo '<span style="color:red;">Server Error!</span>';
        //echo '<br />Debugg: '.$e;
    }
    echo <<<END
                
    <table class="account-tab" border="1" cellpadding="10" cellspacing="0">
            <tr>
                <thead><th colspan='2'>Dane użytkownika</th></thead>
            </tr>
            <tr>
                <td> Name: </td>
                <td> $name $surname</td>
            </tr>
            <tr>
                <td> Nickname: </td>
                <td> $nick </td>
            </tr>
            <tr>
                <td> E-mail: </td>
                <td> $email </td>
            </tr>
            <tr>
                <td> Phone number: </td>
                <td> $phone</td>
            </tr>
            <tr>
                <td> Reserved spot: </td>
                <td> $ID_spot</td>
            </tr>
            <tr>
                <td> Reservation due in: </td>
                <td> $duetime </td>
            </tr>

        </table>

END;
?>
