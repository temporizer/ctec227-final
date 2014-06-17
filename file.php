<?php 
	include_once 'includes/functions.inc.php';
	include_once 'includes/header.inc.php';
?>


	<div class="container content">
		<?php 
			if (!isLoggedIn()) {
				include("login.php");
			} else {
				echo "nothing";
			}
		 ?>
	</div>

<?php include_once 'includes/footer.inc.php'; ?>