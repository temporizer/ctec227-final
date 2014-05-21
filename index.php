<?php include 'includes/header.inc.php'; ?>

<?php login('j.conklin', 'password'); ?>

<pre><?php print_r($_SESSION) ?></pre>

<?php include 'includes/footer.inc.php'; ?>