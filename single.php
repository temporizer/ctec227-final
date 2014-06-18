<?php 
$task = TRUE;
include_once('includes/header.inc.php');
if (isset($_GET['project_id']) && !empty($_GET['project_id'])) {
	$result = getEditProject($_GET['project_id']);	
	$tasks = getTasks($_GET['project_id']);
}
// echo "<pre>";
// print_r($result);
// echo "</pre>";
?>
<div class="container col-lg-8 col-lg-offset-2">
	<div class="row tasks">
		<h1 id="name"><?php echo $result['project_name']; ?></h1>
		<h3 id="manager"><?php echo $result['name']; ?></h3>
		<h4 id="sDate">Start date: <?php echo $result['start_date']; ?></h4>
		<h4 id="eDate">End date: <?php echo $result['end_date']; ?></h4>
		<p id="desc"><?php echo ucfirst($result['description']); ?></p>
		<p id="status">Status: <?php echo $result['status']; ?></p>
	</div>
<div class="row">
<?php 
	if (isset($_GET['addtask']) && !empty($_GET['addtask'])) {
		$users = getUsers();
		echo "<select>";
		foreach ($users as $user) {
			echo "<option>";
			echo $user['name'] . ' - ' . $user['rank'];
			echo "</option>";
		}
		echo "</select>";
	}
	?>

	<?php

			if (!empty($tasks)) {
 	?>
			<div class="tasks">
			<h3>Tasks</h3>
		<?php 


				foreach ($tasks as $task) {
					?>
					<div class="row task-row">
						<div class="col-lg-12">
							<?php 

							echo 'Task: ' . $task['task'];
							echo "<br>";
							echo "Description: " . $task['description'];
							echo "<br>";
							echo 'Assigned to: ' . $task['name']; 
							echo "<br>";
							echo "Status: " . $task['status'];
							echo "<br>";

							?>

						</div>
					</div>


					<?php
				}
			}

		 ?>
		
	</div>
</div>
</div>

<?php include_once('includes/footer.inc.php'); ?>