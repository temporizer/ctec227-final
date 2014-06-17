<?php include 'includes/header.inc.php'; ?>

<?php 
$results = getProjects();
$result = getTasks();
// echo "<pre>";
// print_r($result);
// echo "</pre>";
?>
  
	<div class="container">
		<div class="row">
			<div class="col-lg-8 content">
				<h1 class="mighty">List of Projects</h1>
				<h2>Please log in to see details and to make changes.</h2>
				<table class="table table-bordered">
					<tr>
						<th>Project Name</th>
						<th>Project Manager</th>
						<th>Start Date</th>
						<th>Due Date</th>
						<th>Status</th>
					</tr>
				</table>
				
			</div> <!-- end col-md-8 -->
			<div class="col-lg-4">
				<section id="sidebar">
						<?php if(isLoggedIn()){?>
					<p>Welcome, <?php echo $_SESSION['first_name']; ?>. <a href="logout.php">Logout</a></p>
						<?php } else {
							include('login.php');
						} ?>

						<!-- <div class="buttons">
							<button>New Project</button>
							<button>Print View</button>
							<button>button3</button>
							<button>button4</button>
					</div> -->
				</section>
				</div>
		</div> <!-- end row -->
	</div> <!-- end container -->


<?php include 'includes/footer.inc.php'; ?>