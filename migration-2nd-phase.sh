#!/bin/bash

# For 2nd phase of automated migration of wordpress sites for targetlocal job

USERLIST="floodand eminneapolis" 

LOG=migration.log
exec 1>$LOG 2>&1

for USER in $USERLIST
do
  sudo cp cpmove-$USER.tar.gz /web 
                           ## /mnt/http_data/bkps_httpd2/ is not working
  /scripts/restorepkg $USER
done
