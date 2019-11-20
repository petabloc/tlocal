!/bin/bash

# For 1st phase of automated migration of wordpress sites for targetlocal job

USERLIST="floodand eminneapolis" 

LOG=migration.log
exec 1>$LOG 2>&1

for USER in $USERLIST
do
  /scripts/pkgacct $USER
  FILENAME="cpmove-$USER.tar.gz"
  scp -P 2232 "/home3/$FILENAME" brien@45.79.6.53:/tlm-admins/brien/
  echo "$USER archive copied to new server"
done
