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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js"></script>
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
            <div id="parking-container">
            </div>
            <div id="temperature">
                <canvas id="temperature-plot" width="450" height="250"></canvas>
            </div>
            <div id="gas">
                <canvas id="gas-plot" width="450" height="250"></canvas>
            </div>
            <!--<div class="temp" style="clear: both; float: left; position: relative; height:20vh; width:30vw">
                 <canvas id="temperature-plot"></canvas>
            </div>
            <script src="scripts/temperature.js"></script>
            <div class="gas" style="float: left; position: relative; height:20vh; width:30vw">
                 <canvas id="gas-plot"></canvas>
            </div>
            <script src="scripts/temperature.js"></script>
            <script src="scripts/gas.js"></script>-->

            <!--<div style="width:240px; height:240px">
                <canvas id="temperature-plot" width="300" height="150"></canvas>
            
            </div>
           
            <div style="width:240px; height:240px">
                <canvas id="gas-plot" width="300" height="150"></canvas>
                
            </div> -->
            <script src="scripts/plots.js"></script>
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
    <script>
        $(function() {
            setInterval(function() {
                $.ajax({
                type: "GET",
                url: "get_parkingSpot.php",
                success: function(html) {
                    $("#parking-container").html(html);
                    }
                });
            }, 1000);//every 1000 ms
        });
    </script>
</body>

</html>