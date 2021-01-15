<?php

    require_once "connectect.php";

    // API Key value to be compatible with the ESP8266 code 
    $api_key_value = "a5e4d1ab-6115-4e7f-b1f3-551b4ca4da85";

    //api_key=a5e4d1ab-6115-4e7f-b1f3-551b4ca4da85&ID_parking=1&Temperature=23.15&Gas_level=123&Fire_hazard&Spot1=1&Spot2=0&Spot3=1&Spot4=0&Spot5=1
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $api_key = data_rep($_POST["api_key"]);
        if($api_key == $api_key_value) {
            
            $ID_parking = data_rep($_POST["ID_parking"]);
            $Temperature = data_rep($_POST["Temperature"]);
            $Gas_level = data_rep($_POST["Gas_level"]);
            $Fire_hazard = data_rep($_POST["Fire_hazard"]);
            $Spot1 = data_rep($_POST["Spot1"]);
            $Spot2 = data_rep($_POST["Spot2"]);
            $Spot3 = data_rep($_POST["Spot3"]);
            $Spot4 = data_rep($_POST["Spot4"]);
            $Spot5 = data_rep($_POST["Spot5"]);
            

            if($Spot1 == 1) $Spot1 = "Occupied"; else $Spot1 = "Free";
            if($Spot2 == 1) $Spot2 = "Occupied"; else $Spot2 = "Free";
            if($Spot3 == 1) $Spot3 = "Occupied"; else $Spot3 = "Free";
            if($Spot4 == 1) $Spot4 = "Occupied"; else $Spot4 = "Free";
            if($Spot5 == 1) $Spot5 = "Occupied"; else $Spot5 = "Free";
        
            $Gas_level = (int)$Gas_level; //Gas_level is post as %03d

            // Create connection
            $connect = new mysqli($servername, $username, $password, $dbname);
            // Check connectection
            if ($connect->connect_errno!=0)
            {
                echo "Error: ".$connect->connect_errno;
            }
            else
            {

                //$sql = connect->query('UPDATE parking SET "ID_parking"='.$ID_parking.', "ID_post"='.$ID_post.', "Temperature"='.$Temperature.);
                $sql = $connect->query("INSERT INTO `parking` (`ID_data`, `ID_parking`, `Temperature`, `Gas_level`, `Fire_hazard`, `Reading_time`) VALUES (NULL, '$ID_parking', '$Temperature', '$Gas_level', '$Fire_hazard', current_timestamp())");
                
                $sql = $connect->query("UPDATE parking_spots SET State=CASE
                                        WHEN State='Reserved' THEN 'Reserved'
                                        ELSE '$Spot1' 
                                        END,
                                        Reading_time = current_timestamp()
                                        WHERE ID_spot = 1");
                $sql = $connect->query("UPDATE parking_spots SET State=CASE
                                        WHEN State='Reserved' THEN 'Reserved'
                                        ELSE '$Spot2' 
                                        END,
                                        Reading_time = current_timestamp()
                                        WHERE ID_spot = 2");
                $sql = $connect->query("UPDATE parking_spots SET State=CASE
                                        WHEN State='Reserved' THEN 'Reserved'
                                        ELSE '$Spot3' 
                                        END, 
                                        Reading_time = current_timestamp()
                                        WHERE ID_spot = 3");
                $sql = $connect->query("UPDATE parking_spots SET State=CASE
                                        WHEN State='Reserved' THEN 'Reserved'
                                        ELSE '$Spot4' 
                                        END,
                                        Reading_time = current_timestamp()
                                        WHERE ID_spot = 4");
                $sql = $connect->query("UPDATE parking_spots SET State=CASE
                                        WHEN State='Reserved' THEN 'Reserved'
                                        ELSE '$Spot5' 
                                        END,
                                        Reading_time = current_timestamp()
                                        WHERE ID_spot = 5");
            }
            
            if ($sql == TRUE) {
                echo "New record created successfully";
            } 
            else {
                echo "Error: " . $sql . "<br>" . $connect->error;
            }
        
            $connect->close();
        }
        else {
            echo "Wrong API Key provided.";
        }

    }
    else {
        echo "No data posted with HTTP POST.";
    }


    //make post data clean
    function data_rep($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
?>

