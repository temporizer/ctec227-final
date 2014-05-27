<?php include 'includes/header.inc.php'; ?>

<?php if(isLoggedIn()){?>
	<p>Welcome, <?php echo $_SESSION['first_name']; ?>. <a href="logout.php">Logout</a></p>
<?php } else {
	include('login.php');
	} ?>
  

<h1>Please log in to make changes</h1>
<table></table>

<?php include 'includes/footer.inc.php'; ?>