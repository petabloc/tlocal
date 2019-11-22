#!/bin/bash

source ./includes

# For 1st phase of automated migration of wordpress sites for targetlocal job

if [ -z "$1" ]; then
  USERLIST="floodand eminneapolis"
else
  USERLIST=$1
fi

LOG=migration.log
exec 1>$LOG 2>&1

#Prepare
mkdir -p $EXPORTS

for USER in $USERLIST; do
  /scripts/pkgacct --skiplogs --skipbwdata $USER $EXPORTS
  trapError
  echo $USER >> migration-success.log
done
# Copy everything to the remote
scp -P 2232 $EXPORTS/*.gz $DEST_HOST$DEST_DIR
trapError
