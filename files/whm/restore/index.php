<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../style.css"></link>
</head>
<body>
<div class="headcontent">
        <a href="../index.php">cPBackIT - cPanel Remote Backup</a>
</div>
<div class="content">
<?php
#!/usr/bin/php-cgi

#WHMADDON:cpbackit:cPbackit Remote Backups


function checkacl ($acl) {
        $user = $_ENV['REMOTE_USER'];

        if ($user == "root") {
                return 1;
        }

        $reseller = file_get_contents("/var/cpanel/resellers");
        foreach ( explode( "\n", $reseller ) as $line ) {
                if ( preg_match( "/^$user:/", $line) ) {
                        $line = preg_replace( "/^$user:/", "", $line);
                        foreach ( explode(",", $line )  as $perm ) {
#                               if ( $perm == "all" || $perm == $acl ) {
                               if ( $perm == "create-acct" || $perm == $acl ) {
                                        return 1;
                                }
                        }
                }
        }
        return 0;
}
$usario = $_ENV['REMOTE_USER'];

?>
<p>
<table border="1" width="100%" color="black">
<tr>
<td> <font size='2'>
<b>
<?php if (!checkacl("default")) {
        print "Access Denied";
} else {
        print "You have access!";
}

?></b><i><?php echo" Dear $usario we thank you by using my plugin, please update your FTP details , help me developing more, please ensure that the account username does not exist, make sure too that you have cpmove- liked name, if not please change it, when you click on restore please dont close the window while loading, it needs to be open until the restore is finished" ?></a></i>
 </font>
</td>
</tr>
</table>
</p>
<p>

<form target="_blank" action="restore.php" method="get">
Filename: <input type="text" name="filename"><br>
<input type="submit">
</form>

</p>
<a href="../index.php">Back to Index</a>
</div>
<?php include('../footer.php'); ?>
