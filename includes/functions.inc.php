<?php 
session_start();
ob_start();
include_once "connect.inc.php";


function userExist($username, $password) {
}

function login($username, $password) {
	global $dbc;
	
	$query = "SELECT * FROM user WHERE username='$username' AND pass=sha1('$password') AND active='1' LIMIT 1";
	$result = mysqli_query($dbc, $query);



	if (mysqli_num_rows($result) === 1) {
		$user = mysqli_fetch_assoc($result);
		$_SESSION['user_id'] = $user['user_id'];
		$_SESSION['first_name'] = $user['first_name'];
		$_SESSION['last_name'] = $user['last_name'];
		$_SESSION['email'] = $user['email'];
		$_SESSION['username'] = $user['username'];
		$_SESSION['rank_id'] = $user['rank_id'];
		$_SESSION['logged_in'] = true;
		header("Location: index.php");
	} else {
		$error = "Incorrect username/password combination";
		echo $error;
	}
		
}

// Checks to see if user is logged in or not
function isLoggedIn() {
	if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] == true) {
		return true;
	} else {
		return false;
	}
}


function logout() {
	if (isLoggedIn()) {
		session_destroy();
		header("Location: index.php");
	} else {
		header("Location: index.php");
	}
}

function getUsers() {
	$results = NULL;
	$sql = "SELECT * FROM theUsers";
	$query = mysqli_query($GLOBALS['dbc'], $sql);
	
	$num_rows = mysqli_num_rows($query);
	for ($i=0; $i < $num_rows; $i++) { 
		$results[] = mysqli_fetch_assoc($query);
	}
	return $results;
}

function getProjects($id=NULL) {
	$results = NULL;
	$sql = "SELECT * FROM theProjects";
	if($id != NULL) {
		$sql .= " WHERE user_id=$id";
	}
	$query = mysqli_query($GLOBALS['dbc'], $sql);
	$num_rows = mysqli_num_rows($query);

	for ($i=0; $i < $num_rows; $i++) { 
		$results[] = mysqli_fetch_assoc($query);
		$results[$i]['start_date'] = date('M d, Y', $results[$i]['start_date']);
		$results[$i]['end_date'] = date('M d, Y', $results[$i]['end_date']);
		unset($results[$i]['user_id']);
	}
	return $results;
}

function getTasks($id = NULL) {
	$results = NULL;
	$sql = "SELECT * FROM getTasks WHERE user_id='5'";

	$query = mysqli_query($GLOBALS['dbc'], $sql);
	$num_rows = mysqli_num_rows($query);

	for ($i = 0; $i < $num_rows; $i++) {
		$results[] = mysqli_fetch_assoc($query);
	}
	return $results;
}



function checkPerm() {
	if(isset($_SESSION['rank_id'])) {
		$rank = $_SESSION['rank_id'];
	}
}





ob_flush();
 ?>