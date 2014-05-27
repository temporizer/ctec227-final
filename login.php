<?php 
include_once('includes/functions.inc.php');


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	$username = $_POST['username'];
	$password = $_POST['password'];
	
	login($username, $password);


}



 ?>
<form action="index.php" method="POST">
	<input type="text" name="username" id="username" placeholder="Username">
	<input type="password" name="password" id="password" placeholder="Password">
	<button type="submit">Login</button>
	<p>Forgot your password?</p>
</form>