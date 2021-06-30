<?php
#!/usr/bin/php-cgi

$usario = $_ENV['REMOTE_USER'];
$lines = file("/home/".$usario."/.cpbackit/cpbackit.conf");

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
