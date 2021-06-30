<?php
include "main.php";
//detection part
$word1 = $_GET["filename"];
$words = $word1;
$words = preg_replace('/0/', '', $words ); // remove numbers
$words = preg_replace('/1/', '', $words ); // remove numbers
$words = preg_replace('/2/', '', $words ); // remove numbers
$words = preg_replace('/3/', '', $words ); // remove numbers
$words = preg_replace('/4/', '', $words ); // remove numbers
$words = preg_replace('/5/', '', $words ); // remove numbers
$words = preg_replace('/6/', '', $words ); // remove numbers
$words = preg_replace('/7/', '', $words ); // remove numbers
$words = preg_replace('/8/', '', $words ); // remove numbers
$words = preg_replace('/9/', '', $words ); // remove numbers
$words = preg_replace('/-/', '', $words );
$str1 = substr($words, 6);
$final = "cpmove-$str1";
//echo $str1;
$user = substr($str1, 0, -7);
//echo $final;
                $restorecmd1 = "wget -O /home/'".$final."' ftp://'".$key_remote_user."':'".$key_remote_port."'@'".$key_remote_ip."'/'".$key_restination_folder."'/'".$word1."'";
                $restorecmd2 = "rm -rf /home/'".$final."' /home/cpmove-'".$user."'";
                $restorecmd6 = "/scripts/restorepkg ".$user;
                $restorecmd3 = "/usr/local/cpanel/bin/whmapi1 modifyacct user='".$user."' owner='".$usario."'";
                system( "{$restorecmd1}" );
                system( "{$restorecmd6}" );
                system( "{$restorecmd2}" );
                system( "{$restorecmd3}" );

?>
