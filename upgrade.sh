LOGFILE=/root/cpbackit.log
WHM=/usr/local/cpanel/whostmgr/docroot/cpbackit/
REPO=https://raw.githubusercontent.com/taidos/cpbackit/master
rm -rf /usr/local/cpanel/whostmgr/docroot/cpbackit/landing.php > $LOGFILE  2>&1
curl -o $WHM/landing.php $REPO/files/whm/landing.php > $LOGFILE  2>&1
mkdir $WHM/restore > $LOGFILE  2>&1
curl -o $WHM/restore/index.php $REPO/files/whm/restore/index.php > $LOGFILE  2>&1
curl -o $WHM/restore/restore.php $REPO/files/whm/restore/restore.php > $LOGFILE  2>&1
curl -o $WHM/restore/main.php $REPO/files/whm/restore/main.php > $LOGFILE  2>&1
