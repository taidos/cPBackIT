#!/bin/bash
#Copyright 2011 (c) carlos-faustino.com
RED='\033[01;31m'
GREEN='\033[01;32m'
RESET='\033[0m'
echo -ne "Removing cPBackIT .."
rm -rf /usr/local/cpanel/whostmgr/docroot/cgi/addon_cPBackIT.cgi;
rm -rf /usr/local/cpanel/whostmgr/docroot/cgi/cpbackit;
rm -rf /var/log/cpbackit;
rm -rf /scripts/cpbackit;
rm -rf /etc/cpbackit;
/usr/bin/crontab -l | grep -v 'cpbackit' > /var/spoorl/cron/root
echo -e "[ $GREEN done $RESET ]"
echo -e "[ Thanks for used our Plugin, i hope you can send one feedback to info@cpbackit.in about the reason of your leaving ]"
	
