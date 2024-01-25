#!/bin/bash

echo "------------------------"
echo "| Step 1: Start dirsrv |"
echo "------------------------"

/usr/lib/dirsrv/dscontainer -r &

echo "------------------------------------"
echo "| Step 2: Wait for dirsrv to start |"
echo "------------------------------------"

# until ldapwhoami -H ldap://localhost:3389 -x | grep -q "anonymous";
# until dsctl --json slapd-localhost healthcheck | grep -q "[]";
until /usr/lib/dirsrv/dscontainer -H;
do
  echo $(date) " Still waiting for dirsrv to start..."
  sleep 5
done

# TODO: healthcheck above returns even if dirsrv isn't quite ready so sleep
sleep 5

echo "---------------------"
echo "| Step 3: Configure |"
echo "---------------------"
# Note: Mount your own /setup.sh script if you don't want the default
if [ ! -f /setup-complete ]; then
/setup.sh
touch /setup-complete
fi

echo "----------"
echo "| READY! |"
echo "----------"

sleep infinity