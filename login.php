
<?php
	session_start();
	
	if ((isset($_SESSION['islogin'])) && ($_SESSION['islogin']==true))
	{
		header('Location: index.php');
		exit();
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
                <div class="option">Abaut parking</div>
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
                    <h2>Sign In</h2>

                    <form action="login_system.php" method="post">

                        <fieldset>

                        <p><label for="text">Nickname:</label></p>
                        <p><input type="text" id="email" name="login"></p>

                        <p><label for="password">Password:</label></p>
                        <p><input type="password" id="password" name="password"></p>

                        <?php
                            if(isset($_SESSION['Error']))
                            {
                                echo '<div class="error">'.$_SESSION['Error'].'</div>';
                                unset($_SESSION['Error']);
                            }
                        ?>
                    
                            <p><input type="submit" value="Sign In"></p>
                            <p><label for="text">Create account:</label></p>
                            <p><input type="submit" value="Sign Up" name="registration"></p>

                        </fieldset>

                    </form>
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