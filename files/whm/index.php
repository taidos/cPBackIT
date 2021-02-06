#!/usr/bin/php-cgi
<?
#WHMADDON:test:PHP Test App
$usario = $_ENV['REMOTE_USER'];
if (!checkacl("default")) {
	print "Access Denied, dear $usario please ask for create account permissions to your webhost provider, otherwise this function is not available to you";
} else {
#	print "You have access!";
header('Location: landing.php');
}

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
#				if ( $perm == "all" || $perm == $acl ) {
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
