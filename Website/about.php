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
            <div id="aboutText">
                <h2>Parking</h2>
                <p>
                    During this semesters second block there was a different project-based classes - 
                “Systemy mikroprocesorowe” or Microprocessor-based Systems. This website is a very much
                needed system that overlooks the parking lot model.  The primary goal was to make a web-based application connected to a 
                database where the data from the sensors will be sent. The application  also supervises the 
                registration of parking lot users. After the registration they are able to reserve a spot 
                for themselves if it is available. Whether the user is logged in or not they can look up the state of the parking lot,
                both as simply stated values and plots generated in real time.
                </p>
                <!--<img width="550" src="images/parkingBig.jpg" alt="Smart Parking" />-->
            </div>
            <div id="photoMini">
                <img width="420" height="358" src="images/photoAbout2.jpg" alt="Smart Parking" />
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