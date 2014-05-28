<?php include 'includes/header.inc.php'; ?>

<?php 
$results = getProjects();

echo "<pre>";
print_r($results);
echo "</pre>";
?>
  

<h1 class="mighty">List of Projects</h1>
<h2>Please log in to see details and to make changes.</h2>
<table>
<tr>
  <th>Project Name</th>
  <th>Project Manager</th>
  <th>Start Date</th>
  <th>Due Date</th>
  <th>Status</th>
</tr>
<tr>
  <td>I'm Watching U</td>
  <td>Mrs. Barnes</td>
  <td>4/14/2014</td>
  <td>5/15/2020</td>
  <td>Active</td>
</tr>
<tr>
  <td>I'm Watching U</td>
  <td>Mrs. Barnes</td>
  <td>4/14/2014</td>
  <td>5/15/2020</td>
  <td>Active</td>
</tr>
<tr>
  <td>I'm Watching U</td>
  <td>Mrs. Barnes</td>
  <td>4/14/2014</td>
  <td>5/15/2020</td>
  <td>Active</td>
</tr>
</table>

<?php include 'includes/footer.inc.php'; ?>