<?php 
session_start();
ob_start();
include_once "connect.inc.php";

$error = NULL;

function userExist($username, $password) {
}

function login($username, $password) {
	global $dbc;
	global $error;
	
	$query = "SELECT * FROM curUser WHERE username='$username' AND pass=sha1('$password') AND active='1' LIMIT 1";
	$result = mysqli_query($dbc, $query);



	if (mysqli_num_rows($result) === 1) {
		$user = mysqli_fetch_assoc($result);
		$_SESSION['user_id'] = $user['user_id'];
		$_SESSION['first_name'] = $user['first_name'];
		$_SESSION['last_name'] = $user['last_name'];
		$_SESSION['email'] = $user['email'];
		$_SESSION['username'] = $user['username'];
		$_SESSION['rank_id'] = $user['rank_id'];
		$_SESSION['rank'] = $user['rank'];
		$_SESSION['logged_in'] = true;
		header("Location: index.php");
	} else {
		$error = "Incorrect username/password combination";
		return $error;
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
		// unset($results[$i]['user_id']);
	}
	return $results;
}

function getEditProject($project) {
	$sql = 'SELECT * FROM theProjects WHERE project_id=' . $project;
	$query = mysqli_query($GLOBALS['dbc'], $sql);
	if (mysqli_num_rows($query) == 1) {
		$result = mysqli_fetch_assoc($query);
		$result['start_date'] = date('M d, Y', $result['start_date']);
		$result['end_date'] = date('M d, Y', $result['end_date']);
		return $result;
	}
}

function editProject($array) {
	$project_name = sanitize($array['project_name']);
	$start_date = strtotime($array['start_date']);
	$end_date = strtotime($array['end_date']);
	$description = sanitize($array['description']);
	$status_id = $array['status'];
	$active = $array['active'];
	$user_id = $_SESSION['user_id'];

	$sql = "UPDATE project SET ";
}


function getTasks($id = NULL) {
	$results = NULL;
	$sql = "SELECT * FROM gettasks WHERE project_id='$id'";

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

function createProject($array) {
	$project_name = sanitize($array['project_name']);
	$start_date = strtotime($array['start_date']);
	$end_date = strtotime($array['end_date']);
	$description = sanitize($array['description']);
	$status_id = $array['status'];
	$active = $array['active'];
	$user_id = $_SESSION['user_id'];
	$project_id = $array['project_id'];

	$sql = "SELECT * FROM project WHERE project_id='$project_id'";
	$result = mysqli_query($GLOBALS['dbc'], $sql);
	$num_rows = mysqli_num_rows($result);

	if ($num_rows == 1) {
		$sql = "UPDATE project SET project_name='$project_name', start_date=$start_date, end_date=$end_date, description='$description', status_id=$status_id, active=$active WHERE project_id=$project_id";
		mysqli_query($GLOBALS['dbc'], $sql);
	} else {
		$sql = "INSERT INTO project (project_id, project_name, user_id, status_id, start_date, end_date, description, active) VALUES('', '$project_name', $user_id, $status_id, $start_date, $end_date, '$description', '$active')";
		mysqli_query($GLOBALS['dbc'], $sql);
		
	}

	
	echo $sql;

	header("Location: index.php");
}

function sanitize($data) {
	$sanitized = mysqli_real_escape_string($GLOBALS['dbc'], strip_tags(trim($data)));
	return $sanitized;
}



ob_flush();
 ?>