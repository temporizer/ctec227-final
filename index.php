<?php include 'includes/header.inc.php'; ?>

<?php 


if ((isset($_SESSION['rank_id'])) && $_SESSION['rank_id'] == 1) {
	$results = getProjects();
} else {
	if (isset($_SESSION['rank_id'])) {
	$results = getProjects($_SESSION['user_id']);
	}
}


//$result = getTasks();
// echo "<pre>";
// print_r($_SESSION);
// echo "</pre>";
?>
  
<div class="container content">
		<?php 
			if (!isLoggedIn()) {
				include("login.php");
			} else { ?>
			
			<?php 
				if (!empty($results)) {

			 ?>
					<div class="projects">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="pName">Project Name</th>
									<th class="desc">Description</th>
									<th class="manager">Manager</th>
									<th class="sDate">Start Date</th>
									<th class="eDate">End Date</th>
									<th class="status">Status</th>
									<?php if(isset($_SESSION) && $_SESSION['rank_id'] != 3) {echo '<th class="edit">Edit</th>';} ?>
								</tr>
							</thead>
							<tbody>
								<?php 
									foreach ($results as $key) {
										echo "<tr>";
										echo "<td>";
										echo '<a href="single.php?project_id=' . $key['project_id'] . '">' . $key['project_name'] . '</a>';
										echo "</td><td>";
										echo $key['description'];
										echo "</td><td>";
										echo $key['name'];
										echo "</td><td>";
										echo $key['start_date'];
										echo "</td><td>";
										echo $key['end_date'];
										echo "</td><td>";
										echo $key['status'];
										echo "</td>";

										if (isset($_SESSION) && $_SESSION['rank_id'] != 3) {
											echo "<td>";
											echo '<a href="project.php?edit=' . $key['project_id'] . '">edit</a>';
											echo "</td>";
										}


										echo "</tr>";
									}

							 	?>
							</tbody>
						</table>
					</div>




			<?php 
				} else {
					echo "<h2>No projects</h2>";
				}
			}
			 ?>
	</div>

<?php include 'includes/footer.inc.php'; ?>