<?php

$connection = mysqli_connect("localhost",'root','','pandha_bus');

if(!$connection) {
	die("Unable to connect" . mysqli_error($connection));
}

?>