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
			<div class="col-lg-8">
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
					<?php

					foreach ($results as $value) {
						echo "<tr>"; 
						echo "<td>";
						echo $value['project_name'];
						echo "</td>";
						echo "<td>";
						echo $value['name'];
						echo "</td>";
						echo "<td>";
						echo $value['start_date'];
						echo "</td>";
						echo "<td>";
						echo $value['end_date'];
						echo "</td>";
						echo "<td>";
						echo $value['status'];
						echo "</td>";
						echo "</tr>";
					}

					 ?>
				</tr>
				</table>
			</div>
		</div>
	</div>


<?php include 'includes/footer.inc.php'; ?>