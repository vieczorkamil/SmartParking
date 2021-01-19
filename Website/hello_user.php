<?php

	session_start();
	
	if (!isset($_SESSION['isregister']))
	{
		header('Location: index.php');
		exit();
	}
	else
	{
		unset($_SESSION['isregister']);
	}
	
    // Deleting remembered data using in registration
    if (isset($_SESSION['fr_Nick'])) unset($_SESSION['fr_Nick']);
    if (isset($_SESSION['fr_Name'])) unset($_SESSION['fr_Name']);
    if (isset($_SESSION['fr_Surname'])) unset($_SESSION['fr_Surname']);
    if (isset($_SESSION['fr_Email'])) unset($_SESSION['fr_Email']);
    if (isset($_SESSION['fr_Phone'])) unset($_SESSION['fr_Phone']);
	if (isset($_SESSION['fr_Password1'])) unset($_SESSION['fr_Password1']);
	if (isset($_SESSION['fr_Password2'])) unset($_SESSION['fr_Password2']);
	if (isset($_SESSION['fr_Regulations'])) unset($_SESSION['fr_Regulations']);
	
	// Deleting registration error
    if (isset($_SESSION['e_Nick'])) unset($_SESSION['e_Nick']);
    if (isset($_SESSION['e_Name'])) unset($_SESSION['e_Name']);
    if (isset($_SESSION['e_Surname'])) unset($_SESSION['e_Surname']);
    if (isset($_SESSION['e_Email'])) unset($_SESSION['e_Email']);
    if (isset($_SESSION['e_Phone'])) unset($_SESSION['e_Phone']);
	if (isset($_SESSION['e_Password'])) unset($_SESSION['e_Password']);
	if (isset($_SESSION['e_Regulations'])) unset($_SESSION['e_Regulations']);
	
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
            <div class="grid">
            <div id="sign_in_up">
                <h2>Welcome</h2>
                <fieldset>
                    <p><label for="text">Your account was created successfully!</label></p>
                    <br/>
                    <a href="login.php" ><td><p><input type="submit" value="Sign In"></p></td></a>
                </fieldset>
            </div>
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