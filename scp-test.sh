#!/bin/bash

#testing scp and ssh over shell scripts
 
# This should result in three text files in home directory, copies of same
# in home directory of other server, and a text file with three lines in it 
# in other server.
 
USERLIST="alice bob charlie"

LOG=scp-test.log
exec 1>$LOG 2>&1
for USER in $USERLIST
do
  echo "attempting $USER"
  FILENAME="$USER.txt"
  echo "This is a test for $USER" > $FILENAME
  scp -p 2232 $FILENAME brien@45.79.6.53:/tlm-admins/brien/
  CMD="echo 'happy little text' >> /tlm-admins/brien/result.txt"
  ssh brien@45.79.6.53 -p 2232 "$CMD"
done
