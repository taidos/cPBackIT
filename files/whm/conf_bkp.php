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

$lines = file("/home/".$usario."/.cpbackit/cpbackit.conf");
#$lines = file("/home/carlos/.cpbackit/cpbackit.conf");
foreach ($lines as $key) {
$term = explode("=",trim($key));
        if($term[0]=='HOST'){
        		$key_remote_ip=$term[1];
       		}
	elseif( $term[0]=='USER') {
			$key_remote_user=$term[1];
		}
	elseif($term[0]=='PASSWD' ) {
			$key_remote_port=$term[1];
		}
	elseif($term[0]=='FOLDER' ) {
			$key_restination_folder=$term[1];
		}	
        elseif($term[0]=='EMAIL' ) {
                        $key_email=$term[1];
                }

}
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

?></b><i><?php echo" Dear $usario we thank you by using my plugin, please update your FTP details"; ?> <a href="http://carlos-faustino.com"help me 
developing more</a></i>                           
 </font>              
</td>
</tr>
</table>
</p>
<p>
<form action="conf_bkp_update.php" method="post">
<table border="1" width="100%"  cellspacing="0">
<tr height="40px"  bgcolor="#C1C1C1">
<td width="400px" align="center"><font size="2"><strong>Feature</strong></font><br></td>
<td width="600px" align="center"><font size="2"><strong>Value</font><br></td> 
</tr>
<tr height="30px">
<td width="400px" align="left">IP/Hostname<br /></td>
<td width="600px" align="left"><input type="text" name="key_hname" size="20" value="<?php echo $key_remote_ip; ?>"><br /></td> 
</tr>
<tr height="30px">
<td width="400px" align="left">Username<br /></td>
<td width="600px" align="left"><input type="text" name="key_user" size="20" value="<?php echo $key_remote_user;  ?>"><br />( A remote user , eg:bkpusr)</td> 
</tr>
<tr height="30px">
<td width="400px" align="left">Password<br /></td>
<td width="600px" align="left"><input type="text" name="key_port" size="20" value="<?php echo $key_remote_port;  ?>">(Password stills no encrypted)<br  /></td> 
</tr>
<tr height="30px">
<td width="400px" align="left">Folder<br /></td>
<td width="600px" align="left"><input type="text" name="key_folder" size="20" value="<?php echo $key_restination_folder; ?>">(No ending  '/')<br /></td> 
</tr>
<tr height="30px">
<td width="400px" align="left">Email<br /></td>
<td width="600px" align="left"><input type="text" name="key_email" size="20" value="<?php echo $key_email; ?>">(Email where will be send email)<br /></td>
</tr>


</table><br >

</form>
</p>
<a href="edit_bkp.php">Edit Backup Configuration</a>
</div>
<?php include('footer.php'); ?>
