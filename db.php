<?php
	$host = 'localhost';
	$user = 'root';
	$pass = '';
	$db = 'busbookingdatabase';
	$mysqli = new mysqli($host,$user,$pass,$db) or die($mysqli->error);
?>