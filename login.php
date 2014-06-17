<?php 
	include_once('includes/functions.inc.php');

	if ($_SERVER['REQUEST_METHOD'] === 'POST') {
		$username = $_POST['username'];
		$password = $_POST['password'];

		login($username, $password);
	} 
?>

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				
				<form action="index.php" method="POST" id="login">
					<div class="row">
						<input type="text" class="col-md-6 col-md-offset-3" id="username" name="username" placeholder="Username" value="<?php echo (isset($username) && !empty($username)) ? $username: '' ?>">
					</div>
					<div class="row">
						<input type="password" class="col-md-6 col-md-offset-3" id="password" name="password" placeholder="Password">
					</div>
					<div class="row">
						<button type="submit" class="btn btn-primary col-md-6 col-md-offset-3">Log In</button>
						<!-- <a href="" class="btn btn-primary col-md-6 col-md-offset-3">Log In</a> -->
					</div>
					<p>
					<?php if ($error != NULL) { echo $error; } ?>
					</p>
				</form>
			</div>
		</div>