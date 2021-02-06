<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css"></link>
</head>
<body>
<div class="headcontent">
        <a href="index.php">cPBackIT - cPanel Remote Backup</a>
</div>
<div class="content">

<form action="processscript.php" method="post">
<textarea rows="25" cols="40" name="content">
<?

$usario = $_ENV['REMOTE_USER'];

#$fn = file("/home/".$usario."/.cpbackit/cpbackit.conf");
$fn = "/home/".$usario."/.cpbackit/cpbackit.conf";
#$fn = "/home/carlos/.cpbackit/cpbackit.conf";
print htmlspecialchars(implode("",file($fn)));
?> 
</textarea><br>
<input type="submit" value="Change!"> 
</form>
</p>
<a href="conf_bkp.php">Go Back</a>
</div>
<?php include('footer.php'); ?>

