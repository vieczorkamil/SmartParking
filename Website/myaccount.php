<?php
    session_start();

    if ((isset($_SESSION['islogin'])) && ($_SESSION['islogin'] == false)) {
        header('Location: index.php');
    exit();
}
?>

<?php


require_once "connect.php";
if(isset($_POST['Submit'])){
    try
    {
        $spot = $_POST['spot'];
        $datetime = new DateTime();
        
        $connect = new mysqli($host, $db_user, $db_password, $db_name);
        if ($connect->connect_errno!=0)
        {
            throw new Exception(mysqli_connect_errno());
        }
        else
        {
            $sqlQuery = "SELECT COUNT(ID_spot) as sum FROM parking_spots WHERE ID_client = ".$_SESSION['ID_client'].";";
            $result = $connect->query($sqlQuery);
            $sum_spots = $result->fetch_assoc();
            if($sum_spots['sum']==0){
                $sqlQuery2 = "SELECT State, Reservation_due FROM parking_spots WHERE ID_Spot = '$spot'";
                $result2 = $connect->query($sqlQuery2);
                
                $spot_state = $result2->fetch_assoc();
                switch ($spot_state['State']):
                    case 'Free': 
                        $sqlQuery3 = "UPDATE parking_spots SET ID_Client =".$_SESSION['ID_client'].", State='Reserved', Reservation_due=now()+INTERVAL 3 MINUTE WHERE ID_Spot= '$spot'";
                        $result3 = $connect->query($sqlQuery3);
                        $_SESSION['info_Free']="The chosen spot has been reserved for you!";
                        break;
                    case 'Reserved':
                        $_SESSION['info_Reserved']="This spot is already reserved! This spot will be free at: ".$spot_state["Reservation_due"];
                        break;
                    case 'Occupied':
                        $_SESSION['info_Occupied']="Unfortunately, your chosen spot is already occupied. Please choose another!";
                        break;
                    endswitch;
                $result2->close(); 
                //$result3->close();
            }
            else {
                $_SESSION['info_Already']="You have already reserved a spot!";
            }
            //$result3->close();
            $result->close();
            //$result3->close();
            $connect->close();
    }
    }
    catch(Exception $e)
    {
        echo '<span style="color:red;">Server Error!</span>';
        //echo '<br />Debugg: '.$e;
    }
} else if(isset($_POST['cancel'])){
    try
    {
        $datetime = new DateTime();
        
        $connect = new mysqli($host, $db_user, $db_password, $db_name);
        if ($connect->connect_errno!=0)
        {
            throw new Exception(mysqli_connect_errno());
        }
        else
        {
            $sqlQuery = "UPDATE parking_spots SET State='Free', Reservation_due=0, ID_Client=NULL WHERE ID_Client =".$_SESSION['ID_client'].";";
            $result = $connect->query($sqlQuery);


        }
        $connect->close();
    }
    catch(Exception $e)
    {
        echo '<span style="color:red;">Server Error!</span>';
        //echo '<br />Debugg: '.$e;
    }
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
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

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

            if ((isset($_SESSION['islogin'])) && ($_SESSION['islogin'] == true)) {
                echo
                '<a href="myaccount.php">
                        <div class="option">My account</div>
                    </a>
                    <a href="logout.php">
                        <div class="option">Logout</div>
                    </a>';
            } else {
                echo
                '<a href="login.php">
                    <div class="option">Login</div>
                    </a>';
            }
            ?>
            <div style="clear:both"></div>

        </div>
        <div id="content">
            <div id="parking-container"></div>
            <div id="accountInfo"></div>

            <div id="reservations">
                <h2>Select parking spot you wish to reserve:</h2>
                
                <form method="post">
                <fieldset>
                    <input type="radio" id="spot1" name="spot" value="1">
                    <label for="spot1">Spot 1</label><br/>

                    <input type="radio" id="spot2" name="spot" value="2">
                    <label for="spot2">Spot 2</label><br/>

                    <input type="radio" id="spot3" name="spot" value="3">
                    <label for="spot3">Spot 3</label><br/>
            
                    <input type="radio" id="spot4" name="spot" value="4">
                    <label for="spot4">Spot 4</label><br/>
                   
                    <input type="radio" id="spot5" name="spot" value="5">
                    <label for="spot5">Spot 5</label><br/>
                    <?php
                        if (isset($_SESSION['info_Reserved']))
                        {
                            echo $_SESSION['info_Reserved'];
                            unset($_SESSION['info_Reserved']);
                        }else if(isset($_SESSION['info_Occupied']))
                        {
                            echo $_SESSION['info_Occupied'];
                            unset($_SESSION['info_Occupied']);
                        }else if(isset($_SESSION['info_Free']))
                        {
                            echo $_SESSION['info_Free'];
                            unset($_SESSION['info_Free']);
                        }else if(isset($_SESSION['info_Already']))
                            {
                            echo $_SESSION['info_Already'];
                            unset($_SESSION['info_Already']);
                        }
                    ?>
                    <p><input type="submit" name="Submit" value="Reserve!"></p>
                    <p><input type="submit" name="cancel" value="Cancel reservation"></p>
                </fieldset>
                </form>
                
            </div>
        </div>


        <div id="footer">
            Author Kamil Wieczorek<br />Contact <a href="mailto:kamiwie749@student.polsl.pl" target="_blank">kamiwie749@student.polsl.pl</a>
            <br />
            Author Olaf Kędziora<br />Contact <a href="mailto:olafked238@student.polsl.pl" target="_blank">olafked238@student.polsl.pl</a>
            <br />
            &copy; All rights reserved. 2021.
        </div>
    </div>
    <script>
        $(function parkingSpotUpdate() {
            $.ajax({
                type: "GET",
                url: "get_parkingSpot.php",
                success: function(html) {
                    $("#parking-container").html(html);
                }
                }).then(function(){
                    setTimeout(parkingSpotUpdate, 1000);
                });
        });
        $(function accountUpdate() {
            $.ajax({
                type: "POST",
                url: "get_accountSpots.php",
                success: function(html) {
                    $("#accountInfo").html(html);
                }
                }).then(function(){
                    setTimeout(accountUpdate, 1000);
                });
        });
    </script>
</body>

</html>