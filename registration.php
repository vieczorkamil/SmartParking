<?php

	session_start();
	
	if (isset($_POST['Submit']))
	{
		// Set flag - everything is OK
		$OK=true;
		
		// Checking Nickname
		$Nick = $_POST['Nick'];
		
		if ((strlen($Nick)<3) || (strlen($Nick)>20))
		{
			$OK=false;
			$_SESSION['e_Nick']="Nickname must be 3 to 20 characters long!";
		}
		
		if (ctype_alnum($Nick)==false)
		{
			$OK=false;
			$_SESSION['e_Nick']="Nickname can only consist of letters and numbers";
        }
        
        $Name = $_POST['Name'];
        $Surname = $_POST['Surname'];
		
		// Checking e-mail
		$Email = $_POST['Email'];
		$EmailB = filter_var($Email, FILTER_SANITIZE_EMAIL);
		
		if ((filter_var($EmailB, FILTER_VALIDATE_EMAIL)==false) || ($EmailB!=$Email))
		{
			$OK=false;
			$_SESSION['e_Email']="Invalid e-mail address!";
        }
        // Checking phone number
        $Phone = $_POST['Phone'];
        if(strlen($Phone) != 9)
        {
            $OK = false;
            $_SESSION['e_Phone']="Invalid phone number!";
        }
		
		// Checking password
		$Password1 = $_POST['Password1'];
		$Password2 = $_POST['Password2'];
		
		if ((strlen($Password1)<8) || (strlen($Password1)>20))
		{
			$OK=false;
			$_SESSION['e_Password']="Password must be 3 to 20 characters long!";
		}
		
		if ($Password1!=$Password2)
		{
			$OK=false;
			$_SESSION['e_Password']="Passwords do not match, please retype!";
		}	

		$Password_hash = password_hash($Password1, PASSWORD_DEFAULT);
		
		// Checking Regulations?
		if (!isset($_POST['Regulations']))
		{
			$OK=false;
			$_SESSION['e_Regulations']="Accept the regulations!";
		}				
		
		// Remember the entered data
        $_SESSION['fr_Nick'] = $Nick;
        $_SESSION['fr_Name'] = $Name;
        $_SESSION['fr_Surname'] = $Surname;
        $_SESSION['fr_Email'] = $Email;
        $_SESSION['fr_Phone'] = $Phone;

		if (isset($_POST['Regulations'])) $_SESSION['fr_Regulations'] = true;
		
		require_once "connect.php";
		mysqli_report(MYSQLI_REPORT_STRICT);
		
		try 
		{
			$connect = new mysqli($host, $db_user, $db_password, $db_name);
			if ($connect->connect_errno!=0)
			{
				throw new Exception(mysqli_connect_errno());
			}
			else
			{
				// Does the email already exist?
				$sql = $connect->query("SELECT ID_client FROM clients WHERE Email='$Email'");
				
				if (!$sql) throw new Exception($connect->error);
				
				$isemail = $sql->num_rows;
				if($isemail>0)
				{
					$OK=false;
					$_SESSION['e_Email']="This email already exist!";
				}		

				// Does the nickname already exist?
				$sql = $connect->query("SELECT ID_client FROM clients WHERE Nick='$Nick'");
				
				if (!$sql) throw new Exception($connect->error);
				
				$isnick = $sql->num_rows;
				if($isnick>0)
				{
					$OK=false;
					$_SESSION['e_Nick']="This nickname already exist!";
                }
                
                // Does the phone number already exist?
				$sql = $connect->query("SELECT ID_client FROM clients WHERE Phone='$Phone'");
				
				if (!$sql) throw new Exception($connect->error);
				
				$isphone = $sql->num_rows;
				if($isphone>0)
				{
					$OK=false;
					$_SESSION['e_Phone']="This phone number already exist!";
                }
				if ($OK==true)
				{
					//Every data are correct!
					
					if ($connect->query("INSERT INTO clients VALUES (NULL, NULL, NULL, '$Name', '$Surname', '$Nick' , '$Password_hash', '$Email', '$Phone')"))
					{
						$_SESSION['isregister']=true;
						header('Location: hello_user.php');
					}
					else
					{
						throw new Exception($connect->error);
					}
					
				}
				
				$connect->close();
			}
			
		}
		catch(Exception $e)
		{
			echo '<span style="color:red;">Server Error!</span>';
			//echo '<br />Debugg: '.$e;
		}
		
	}
	
	
?>

<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Registration SmartParking</title>
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
                    <h2>Sign Up</h2>

                    <form method="post">

                        <fieldset>

                            <p><label for="text">Nickname:</label></p>
                            <p><input type="text" value="<?php
                                if (isset($_SESSION['fr_Nick']))
                                {
                                    echo $_SESSION['fr_Nick'];
                                    unset($_SESSION['fr_Nick']);
                                } 
                                ?>" name="Nick"></p>
                                <?php
                                if (isset($_SESSION['e_Nick']))
                                {
                                    echo '<div class="error">'.$_SESSION['e_Nick'].'</div>';
                                    unset($_SESSION['e_Nick']);
                                }
                                ?>
                            
                            <p><label for="text">Name:</label></p>
                            <p><input type="text" value="<?php
                                if (isset($_SESSION['fr_Name']))
                                {
                                    echo $_SESSION['fr_Name'];
                                    unset($_SESSION['fr_Name']);
                                } 
                                ?>" name="Name"></p>
                                <?php
                                if (isset($_SESSION['e_Name']))
                                {
                                    echo '<div class="error">'.$_SESSION['e_Name'].'</div>';
                                    unset($_SESSION['e_Name']);
                                }
                                ?>
                            
                            <p><label for="text">Surname:</label></p>
                            <p><input type="text" value="<?php
                                if (isset($_SESSION['fr_Surname']))
                                {
                                    echo $_SESSION['fr_Surname'];
                                    unset($_SESSION['fr_Surname']);
                                } 
                                ?>" name="Surname"></p>
                                <?php
                                if (isset($_SESSION['e_Surname']))
                                {
                                    echo '<div class="error">'.$_SESSION['e_Surname'].'</div>';
                                    unset($_SESSION['e_Surname']);
                                }
                                ?>

                            <p><label for="text">E-mail:</label></p>
                            <p><input type="text" value="<?php
                                if (isset($_SESSION['fr_Email']))
                                {
                                    echo $_SESSION['fr_Email'];
                                    unset($_SESSION['fr_Email']);
                                } 
                                ?>" name="Email"></p>
                                <?php
                                if (isset($_SESSION['e_Email']))
                                {
                                    echo '<div class="error">'.$_SESSION['e_Email'].'</div>';
                                    unset($_SESSION['e_Email']);
                                }
                                ?>

                            <p><label for="text">Phone:</label></p>
                            <p><input type="text" value="<?php
                                if (isset($_SESSION['fr_Phone']))
                                {
                                    echo $_SESSION['fr_Phone'];
                                    unset($_SESSION['fr_Phone']);
                                } 
                                ?>" name="Phone"></p>
                                <?php
                                if (isset($_SESSION['e_Phone']))
                                {
                                    echo '<div class="error">'.$_SESSION['e_Phone'].'</div>';
                                    unset($_SESSION['e_Phone']);
                                }
                                ?>

                            <p><label for="password">Password:</label></p>
                            <p><input type="password" value="" name="Password1"></p>
                                <?php
                                if (isset($_SESSION['e_Password']))
                                {
                                    echo '<div class="error">'.$_SESSION['e_Password'].'</div>';
                                    unset($_SESSION['e_Password']);
                                }
                                ?>
                                
                            <p><label for="password">Repet password:</label></p>
                            <p><input type="password" value="" name="Password2"></p>
                                
                            <p><label>
                                <input type="checkbox" name="Regulations" <?php
                                if (isset($_SESSION['fr_Regulations']))
                                {
                                    echo "checked";
                                    unset($_SESSION['fr_Regulations']);
                                }
                                    ?>/> Accept Regulations
                            </label></p>
                
                            <?php
                                if (isset($_SESSION['e_Regulations']))
                                {
                                    echo '<div class="error">'.$_SESSION['e_Regulations'].'</div>';
                                    unset($_SESSION['e_Regulations']);
                                }
                            ?>
                    
                            <p><input type="submit" name="Submit" value="Register now"></p>

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