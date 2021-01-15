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
            $sqlQuery1 = "SELECT Fire_Hazard ,Temperature, Reading_time FROM parking GROUP BY Reading_time DESC LIMIT 1";
            $sqlQuery2 = "SELECT COUNT(ID_spot) AS free_spots FROM parking_spots WHERE State = 'Free'";
            $result1 = $connect->query($sqlQuery1);
            
            $indexdata = $result1->fetch_assoc();

            $temp = $indexdata['Temperature'];
            $fire = $indexdata['Fire_Hazard'];
            
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
?>
<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="utf-8">
    <title>Smart Parking</title>
    <meta name="description" content="Smart parking IT project" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="stylesheet" href="styles/style.css" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=DM+Serif+Display&display=swap" rel="stylesheet">
    <script type="text/javascript" src="scripts/timer.js"></script>

</head>

<body onload="time();">
    <div id="container">
        <div id="logo">
            <div>
                <h1>SMART PARKING</h1>
            </div>
        </div>

        <div id="menu">
            <div id="timer"></div>
            <a href="index.php">
                <div class="option">Home page</div>
            </a>
            <a href="about.php">
                <div class="option">About parking</div>
            </a>
            <a href="statistics.php">
                <div class="option">Statistics</div>
            </a>
            
            <?php
                session_start();
                    
                if ((isset($_SESSION['islogin'])) && ($_SESSION['islogin']==true))
                {
                    echo 
                    '<a href="myaccount.php">
                        <div class="option">My account</div>
                    </a>
                    <a href="logout.php">
                        <div class="option">Logout</div>
                    </a>';
                }
                else{
                    echo
                    '<a href="login.php">
                    <div class="option">Login</div>
                    </a>';
                }
            ?>
            <div style="clear:both"></div>

        </div>

        <div id="content">
            <div id="photoBig">
                <img width="550" src="images/parkingBig.jpg" alt="Smart Parking" />
            </div>
            <div id="simpleInfo">
                <?php
                    //echo '<div id="index-spots">Free spots: '.$spots.'</div>';
                    echo "Free spots: ".$spots;
                    echo "<br />Temperature: ".$temp."&#xb0;C";
                    if($fire = 0){
                        echo "<br />Fire alert!";
                    }
                    else{
                        echo "<br />There is no fire hazard";
                    }
                ?>
            </div>
            <div id="photoMini">
                <img width="420" height="233" src="images/parkingMini.jpg" alt="Smart Parking" />
            </div>

        </div>


        <div id="footer">
            Author Kamil Wieczorek<br />Contact <a href="mailto:kamiwie749@student.polsl.pl"
                target="_blank">kamiwie749@student.polsl.pl</a>
            <br />
            Author Olaf Kędziora<br />Contact <a href="mailto:olafked238@student.polsl.pl"
                target="_blank">olafked238@student.polsl.pl</a>
            <br />
            &copy; All rights reserved. 2021.
        </div>
    </div>
</body>

</html>