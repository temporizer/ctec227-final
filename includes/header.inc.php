<?php 
	include_once 'includes/functions.inc.php';
?>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Template</title>
	<link rel="stylesheet" href="css/style.css" media="screen">
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<!-- <meta name="viewport" content="width=device-width,initial-scale=1.0"> -->

</head>
<body>


	<header>
		<div class="container header-bg">
			<div class="row">
				<div class="col-lg-4 logo">
					<img src="images/logo.png" alt="">					
				</div>
				<div class="col-lg-8 heading">
					<h1>GreenWell Bank</h1>
					<h2>Project Management System</h2>
					<?php echo (isLoggedIn()) ? "<div><h4>" . $_SESSION['first_name'] . " " . $_SESSION['last_name'] . "</h4><h4>" . $_SESSION['rank'] . "</h4></div>" : '' ?>
				</div> <!-- end heading -->
			</div> <!-- end row -->
			<div class="row navigation">
				<div class="col-lg-12">
					<nav>
						<?php 
							if (isLoggedIn()) {
						 ?>
						<ul>
							<li><a href="index.php">Home</a></li>
							<?php echo ($_SESSION['rank_id'] < 3) ? '<li><a href="project.php">Create Project</a></li>' : ''; ?>
							
							<li><a href="logout.php">Logout</a></li>
						</ul>
						<?php 
							}
						 ?>
					</nav>
				</div>
			</div> <!-- end navigation -->
		</div> <!-- end container -->
	</header>
	
<section id="wrapper">