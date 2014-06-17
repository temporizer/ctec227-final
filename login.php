<?php 
include_once('includes/functions.inc.php');


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	$username = $_POST['username'];
	$password = $_POST['password'];
	
	login($username, $password);


}



 ?>


<form class="form-horizontal" role="form" action="index.php" method="POST">
  <div class="form-group">
    <label for="username" class="col-sm-3 control-label">Username</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" id="username" name="username" placeholder="Username">
    </div>
  </div>
  <div class="form-group">
    <label for="password" class="col-sm-3 control-label">Password</label>
    <div class="col-sm-9">
      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
    </div>
  </div>
  
  <div class="form-group">
    <div class="col-sm-12 text-center">
      <button type="submit" class="btn btn-default">Sign in</button>
    </div>
  </div>
</form>
