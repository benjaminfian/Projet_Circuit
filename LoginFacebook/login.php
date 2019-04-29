<?php
	require_once "config.php";
	
	$redirectURL = "http://localhost/LoginFacebook/fb-callback.php";
	$permissions = ['email'];
	$loginURL = $helper->getLoginUrl($redirectURL, $permissions);
	
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Log In</title>
</head>
<body>
    <div class="container" style="margin-top:100px">
        <div class="row justify-content-center">
            <div class="col-md-6 col-md-offset-3" align="center">
            <h2>Connexion</h2>
            <form>
                <input name="email" placeholder="Email" class="form-control"<br><br>
                <input name="password" type="password" placeholder="Password" class="form-control"<br><br>
                <input type="submit" value="Log In" class="btn btn-primary">
                <input type="button"  onclick="window.location = '<?php echo $loginURL ?>'" value="Log In with Faceboook" class="btn btn-primary">
            </form>
            </div>
        </div>
    </div>  
		
</html>