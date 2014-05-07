<?php 

define('HOST', 'localhost');
define('USERNAME', 'root');
define('PASSWORD', 'root');
define('DATABASE', 'ctec227_final');

$dbc = mysqli_connect(HOST, USERNAME, PASSWORD, DATABASE) or die();
mysqli_set_charset($dbc, 'utf8');



 ?>