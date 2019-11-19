#!/bin/bash

# For automated migration of wordpress sites for targetlocal job

USERLIST="floodand minnesot" 

for USER in $USERLIST
do
  /scripts/pkgacct $USER
  scp -p 2232 cpmove-$USER.tar.gz brien@45.79.6.53:/mnt/http_data/bkps_httpd2/
  CMD="/scripts/restorepkg $user"
  ssh brien@45.79.6.53 -p 2232 "$CMD"
  echo "$USER migrated"
done
