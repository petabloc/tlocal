#!/bin/bash

# For automated migration of wordpress sites for targetlocal job

USERLIST="floodand minnesot" 

LOG=migration.log
exec 1>$LOG 2>&1

for USER in $USERLIST
do
  /scripts/pkgacct $USER
  FILENAME="cpmove-$USER.tar.gz"
  scp -P 2232 $FILENAME brien@45.79.6.53:/mnt/http_data/bkps_httpd2/
  CMD="/scripts/restorepkg $user"
  ssh brien@45.79.6.53 -p 2232 "$CMD"
  echo "$USER migrated"
done
