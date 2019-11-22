#!/bin/bash

source includes
# For 2nd phase of automated migration of wordpress sites for targetlocal job


LOG=migration-2nd-phase.log
exec 1>$LOG 2>&1

sudo mv /mnt/httpd2_backups/imports/* /web/
for USER in `ls $DEST_DIR|sed 's/cpmove-//'|cut -f1 -d'.'`

do
  /scripts/restorepkg $USER
  echo "$USER restored"
done
