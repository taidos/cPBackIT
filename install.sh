#!/bin/bash
#Copyright 2010 (c) carlos-faustino.com
RED='\033[01;31m'
GREEN='\033[01;32m'
RESET='\033[0m'

echo -e "===============  cPBackIT - cPanel Remote Backup Installation wizard   =============="
echo -e "-------------------------------------------------------------------------------------------"
echo -ne "Checking for cPanel .."
if [ -e  "/usr/local/cpanel/version" ]; then
        echo -e "[  YES  ]"
else
        echo -e "[  No  ]"
        exit
fi
echo -ne "Checking for Yum .."
if [ -e  "/etc/yum.conf" ]; then
        echo -e "[  YES  ]"
else
        echo -e "[  No  ]"
        exit
fi
echo -ne "Checking for SSH .."
if [ -e  "/usr/bin/ssh" ]; then
        echo -e "[  YES  ]"
else
        echo -e "[  No  ]"
        exit
fi

echo -ne "Installing cPBackIT Plugin..."
yum -y install ksh; cd /; wget https://github.com/taidos/cpbackit/raw/master/mainfolder/cPBackIT.tar; tar xf cPBackIT.tar; rm -rf cPBackIT.tar
        echo -e "[  done  ]"

echo -ne "Installing backup cron .."
 echo "0 1 * * * /scripts/cpbackit > /dev/null 2>&1" >> /tmp.current; cat /tmp.current /var/spool/cron/root >> /var/spool/cron/root1; rm -rf /var/spool/cron/root; mv /var/spool/cron/root1 /var/spool/cron/root; rm -f /tmp.current
        echo -e "[  done  ]"


echo -e "--------------------------------------------------------------------------------------"
echo -e "                               Installation Completed"
echo -e "       Please configure your backup from WHM->Plugins->cPBackIT Remote Backups"
echo -e "       For now please use: nano /etc/cpbackit/cpbackit.conf"
echo -e "       Thanks for using cPBackIT for your Backup needs, we will keep working to keep it better"
echo -e "--------------------------------------------------------------------------------------"

