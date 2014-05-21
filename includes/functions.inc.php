<?php 
session_start();
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
	} else {
		echo "false";
		return false;
	}
		
	}

// login() {
// 			if userExist returns true
// 				set $_SESSION variables:
// 					$_SESSION['user_id']
// 					$_SESSION['first_name']
// 					$_SESSION['last_name']
// 					$_SESSION['email']
// 					$_SESSION['username']
// 					$_SESSION['rank_id']
// 					$_SESSION['logged_in'] = true
// 		}

 ?>