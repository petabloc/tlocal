#!/bin/bash

source includes
# For 2nd phase of automated migration of wordpress sites for targetlocal job


LOG=migration.log
exec 1>$LOG 2>&1


for USER in `ls $DEST_DIR/*.tar.gz|sed 's/cpmove-//'|cut -f1 -d'.'`

do

#  mkfs.ext4 /dev/sdsomething
#  mount /dev/sdsomething /imports

# Work with viket to create a temporary disk for imports with enough free disk
# sudo cp cpmove-$USER.tar.gz /imports
## /mnt/http_data/bkps_httpd2/ is not working
  /scripts/restorepkg $USER
done

