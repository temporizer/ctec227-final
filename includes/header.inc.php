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
	<meta name="viewport" content="width=device-width,initial-scale=1.0">

</head>
<body>
	<section id="wrapper">
		<header>
			<div class="logo">
				<img src="images/GreenWell_Bank.png" alt="logo of a green well"> 
				
			</div> <!-- end logo -->
			<div class="title">
			<p>Greenwell Bank</p>
			<p>Project Management System</p>	
			</div>
			
			<nav>
				
			</nav>

		</header> <!-- end header -->

		<section id="sidebar">
			<?php if(isLoggedIn()){?>
		<p>Welcome, <?php echo $_SESSION['first_name']; ?>. <a href="logout.php">Logout</a></p>
			<?php } else {
				include('login.php');
			} ?>

			<div class="buttons">
				<button>New Project</button>
				<button>Print View</button>
				<button>button3</button>
				<button>button4</button>
			</div>
		</section> <!-- end sidebar -->

		<section id="content">