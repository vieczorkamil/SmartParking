<?php

	session_start();
	
	if ((!isset($_POST['login'])) || (!isset($_POST['password'])))
	{
		header('Location: index.php');
		exit();
    }
    
    if(isset($_POST['registration'])){
        header('Location: registration.php');
		exit();
    }

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
            $login = $_POST['login'];
            $password = $_POST['password'];
            
            // Prevent SQL Injection
            $login = htmlentities($login, ENT_QUOTES, "UTF-8");
        
            if ($sql = @$connect->query(
                sprintf("SELECT * FROM clients WHERE Nick='%s'",
                    mysqli_real_escape_string($connect,$login))
                    )
                )
            {
                $isuser = $sql->num_rows;
                if($isuser>0)
                {
                    $db = $sql->fetch_assoc();
                    
                    if (password_verify($password, $db['Password']))
                    {
                        $_SESSION['islogin'] = true;
                        $_SESSION['ID_client'] = $db['ID_client'];
                        $_SESSION['ID_parking'] = $db['ID_parking'];
                        $_SESSION['ID_spot'] = $db['ID_spot'];
                        $_SESSION['Name'] = $db['Name'];
                        $_SESSION['Surname'] = $db['Surname'];
                        $_SESSION['Nick'] = $db['Nick'];
                        $_SESSION['Email'] = $db['Email'];
                        $_SESSION['Phone'] = $db['Phone'];
                        
                        unset($_SESSION['Error']);
                        $sql->free_result();
                        header('Location: index.php');
                    }
                    else 
                    {
                        $_SESSION['Error'] = '<span style="color:red">Incorrect login or password!</span>';
                        header('Location: login.php');
                    }
                    
                } else {
                    
                    $_SESSION['Error'] = '<span style="color:red">Incorrect login or password!</span>';
                    header('Location: login.php');
                    
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
?>