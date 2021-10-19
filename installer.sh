LOGFILE=/root/cpbackit.log
WHM=/usr/local/cpanel/whostmgr/docroot/cpbackit/
REPO=https://raw.githubusercontent.com/taidos/cpbackit/master
#----------------------------------------------
# check for cpanel and as if wants to install
#----------------------------------------------
if [ -d /usr/local/cpanel ]; then

        echo "First leet me say thanks for using my plugin to be easy backup cpanel"
        echo "Please note that i still develop this plugin, any bug you may find please report"
        echo "This plugin is only to backup reseller accounts to thier FTP"
        echo -n "Do you want to continue installing ? [y/N]"

        read over_ride_install

        if ([ "$over_ride_install" == "N" ] || [ "$over_ride_install" == "n" ]); then
                echo "Exiting Installer"
                exit;
        fi

fi
#----------------------------------
# putting standart files on the root cpanel-skel
#----------------------------------

mkdir -p /root/cpanel3-skel/.cpbackit >> $LOGFILE
curl -o /root/cpanel3-skel/.cpbackit/cpbackit.conf $REPO/files/cpbackit.conf  >> $LOGFILE  2>&1

#----------------------------------
# adding new way of backup trow rsync and curlftpfs
#----------------------------------

yum -y install epel-release >> $LOGFILE  2>&1
yum -y install curlftpfs >> $LOGFILE  2>&1
modprobe fuse >> $LOGFILE  2>&1

#----------------------------------
# put the start backup file in root location
#----------------------------------

mkdir /root/cpbackit  >> $LOGFILE  2>&1
curl -o /root/cpbackit/start $REPO/files/start  >> $LOGFILE  2>&1
chmod 777 /root/cpbackit/start  >> $LOGFILE  2>&1

#----------------------------------
# start getting the frontend of WHM and register the app
#----------------------------------

mkdir /usr/local/cpanel/whostmgr/docroot/cpbackit/   >> $LOGFILE  2>&1
curl -o $WHM/about.php $REPO/files/whm/about.php  >> $LOGFILE  2>&1
curl -o $WHM/bg.gif $REPO/files/whm/bg.gif  >> $LOGFILE  2>&1
curl -o $WHM/conf_bkp.php $REPO/files/whm/conf_bkp.php  > $LOGFILE  2>&1
curl -o $WHM/edit_bkp.php $REPO/files/whm/edit_bkp.php  > $LOGFILE  2>&1
curl -o $WHM/footer.php $REPO/files/whm/footer.php >> $LOGFILE  2>&1
curl -o $WHM/index.php $REPO/files/whm/index.php  >> $LOGFILE  2>&1
curl -o $WHM/landing.php $REPO/files/whm/landing.php  > $LOGFILE  2>&1
curl -o $WHM/processscript.php $REPO/files/whm/processscript.php >> $LOGFILE  2>&1
curl -o $WHM/style.css $REPO/files/whm/style.css >> $LOGFILE  2>&1
mkdir /usr/local/cpanel/whostmgr/docroot/cpbackit/restore > $LOGFILE  2>&1
curl -o $WHM/restore/index.php $REPO/files/whm/restore/index.php > $LOGFILE  2>&1
curl -o $WHM/restore/restore.php $REPO/files/whm/restore/restore.php > $LOGFILE  2>&1
curl -o $WHM/restore/main.php $REPO/files/whm/restore/main.php > $LOGFILE  2>&1

#----------------------------------
# allowing php in the addon
#----------------------------------

/usr/bin/perl -pi -e 's/^disable-php-as-reseller-security=.*/disable-php-as-reseller-security=1/' /var/cpanel/cpanel.config >> $LOGFILE  2>&1

#----------------------------------
# add contrab
#----------------------------------

{ crontab -l; echo "0 8 * * * /root/cpbackit/start > /dev/null 2>&1"; } | crontab - >> $LOGFILE  2>&1

#----------------------------------
# register the app
#----------------------------------

curl -o $WHM/cpbackit.appconfig $REPO/files/whm/cpbackit.appconfig >> $LOGFILE  2>&1
/usr/local/cpanel/bin/register_appconfig $WHM/cpbackit.appconfig >> $LOGFILE  2>&1

echo -e "Thanks for using my plugin, i hope you enjoy"
echo -e "Please fallow me in: http://git.carlos-faustino.com"
echo -e "For updates ;)"
