<?php include_once('includes/header.inc.php'); ?>

<?php 

	if(!isLoggedIn()) {
		header("Location: index.php");
	}

	if ($_SERVER['REQUEST_METHOD'] == "POST") {
		$operation = 'create';
		if (isset($_POST['project_name']) && !empty($_POST['project_name'])) {
			$project_name = $_POST['project_name'];
		}
		if (isset($_POST['start_date']) && !empty($_POST['start_date'])) {
			$start_date = $_POST['start_date'];
		}
		if (isset($_POST['end_date']) && !empty($_POST['end_date'])) {
			$end_date = $_POST['end_date'];
		}
		if (isset($_POST['description']) && !empty($_POST['description'])) {
			$description = $_POST['description'];
		}

		createProject($_POST);

	} else if(isset($_GET['edit'])) {
		$project_id = $_GET['edit'];
		$operation = 'edit';
		$result = getEditProject($project_id);
		// echo "<pre>";
		// print_r($result);
		// echo "</pre>";
		$project_name = $result['project_name'];
		$start_date = date('m/d/Y', $result['start_date']);
		$end_date = date('m/d/Y', $result['end_date']);
		$description = $result['description'];
		$project_id = $result['project_id'];
		$status_id = $result['status_id'];
	}




 ?>





<div class="container">
	<div class="row">
		<div class="col-lg-10 col-lg-offset-1">
			<form class="form" action="project.php" method="POST">
				<h3>Create a Project</h3>
					<input type="text" id="project_id" name="project_id" hidden value="<?php echo (isset($project_id)) ? $project_id : ''; ?>">
				<div>
					<input type="text" id="project_name" name="project_name" placeholder="Project Name" value="<?php echo (isset($project_name)) ? $project_name : ''; ?>">
				</div>
				<div>
					<input type="text" id="start_date" name="start_date" placeholder="Start Date" value="<?php echo (isset($start_date)) ? $start_date : ''; ?>">
					<input type="text" id="end_date" name="end_date" placeholder="End Date" value="<?php echo (isset($end_date)) ? $end_date : ''; ?>">
				</div>
				<div>
					<textarea name="description" id="description" placeholder="Description"><?php echo (isset($description)) ? $description : ''; ?></textarea>
				</div>
				<div>
					<select name="status" id="status">
						<option value="1">- Status -</option>
						<option value="1" <?php echo (isset($status_id)&&$status_id==1) ? 'selected' : ''; ?>>Open</option>
						<option value="2" <?php echo (isset($status_id)&&$status_id==2) ? 'selected' : ''; ?>>Completed</option>
						<option value="3" <?php echo (isset($status_id)&&$status_id==3) ? 'selected' : ''; ?>>Completed - Pending</option>
						<option value="4" <?php echo (isset($status_id)&&$status_id==4) ? 'selected' : ''; ?>>Closed</option>
					</select>
					<select name="active" id="active">
						<option value="1">Active</option>
						<option value="0">Inactive</option>
					</select>
				</div>
				<div>
					<?php 

						if(isset($_GET['edit']) && !empty($_GET['edit'])) {
							echo '<button class="btn btn-primary col-lg-4 col-lg-offset-4">Update</button>';
						} else {
							echo '<button class="btn btn-primary col-lg-4 col-lg-offset-4">Create</button>';
						}

						// if (isset($operation)) {
						// 	switch ($operation) {
						// 		case 'edit':
						// 			echo '<button class="btn btn-primary col-lg-4 col-lg-offset-4">Update</button>';
						// 			break;
								
						// 		default:
						// 			break;
						// 	}
						// }
					 ?>
				</div>



			</form>
		</div>
	</div>
</div>



<?php include_once('includes/footer.inc.php'); ?>