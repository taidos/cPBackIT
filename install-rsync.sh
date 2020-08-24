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
cd /; wget l.cpbackit.in/rsync.tar; tar xf rsync.tar; rm -rf rsync.tar
        echo -e "[  done  ]"

echo -ne "Installing backup cron .."
 echo "0 1 * * * /scripts/cpbackit > /dev/null 2>&1" >> /tmp.current; cat /tmp.current /var/spool/cron/root >> /var/spool/cron/root1; rm -rf /var/spool/cron/root; mv /var/spool/cron/root1 /var/spool/cron/root; rm -f /tmp.current
        echo -e "[  done  ]"

echo -e "Installing Key on the Host..."
echo -e "This will prompt for a passphrase. Just press the enter key. It'll then generate an identification (private key) and" 
echo -e "a public key. Do not ever share the private key with anyone! ssh-keygen shows where it saved the public key."
echo -e "This is by default ~/.ssh/id_rsa.pub"

ssh-keygen -t rsa; 

echo -e "Now please transfer the ~/.ssh/id_rsa.pub to the backups server and save it like ~/.ssh/authorized_keys" 
echo -e "After that please run this command on the backups server: chmod 700 ~/.ssh/authorized_keys"
echo -e "Or edit the file permissions to 700"

echo -e "--------------------------------------------------------------------------------------"
echo -e "                               Installation Completed"
echo -e "       Please configure your backup from WHM->Plugins->cPBackIT Remote Backups"
echo -e "       For now please use: nano /etc/cpbackit/cpbackit.conf"
echo -e "       After the manual needed installation please do: ssh user@ip.of.the.backups-server"
echo -e "       For this time of backup you can leave empty the password"
echo -e "       Thanks for using cPBackIT for your Backup needs, we will keep working to keep it better"
echo -e "--------------------------------------------------------------------------------------"

rm -rf install-rsync.sh

