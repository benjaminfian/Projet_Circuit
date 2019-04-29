<?php 
	session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Profile utilisateur</title>
</head>
<body>
    <div class="container" style="margin-top:100px">
        <div class="row justify-content-center">
            <div class="col-md-3">
				<img src="<?php echo $_SESSION['userData']['picture']['url'] ?>">			
            </div>
			<div class="col-md-9">
			<table class="table table-hover table-bordered">
				<tbody>
					<tr>
						<td>ID</td>
						<td><?php echo $_SESSION['userData']['id'] ?></td>
					</tr>
					<tr> 
						<td>Prénom</td>
						<td><?php echo $_SESSION['userData']['first_name'] ?></td>
					</tr>
					<tr>
						<td>Nom</td>
						<td><?php echo $_SESSION['userData']['last_name'] ?></td>
					</tr>
					<tr>
						<td>Courriel</td>
						<td><?php echo $_SESSION['userData']['email'] ?></td>
					</tr>
				</tbody>
			</table>
        </div>
    </div>  
		
</html>