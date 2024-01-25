#!/bin/bash

# One-time initialization can run during image build to speed up future runs.
# This may be a terrible idea though: https://github.com/389ds/389-ds-base/issues/4620
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
sleep 10

echo "--------------------"
echo "| Step 3: Shutdown |"
echo "--------------------"
kill $(ps -ef | grep slapd-localhos[t] | tr -s " " | cut -d " " -f 2)

# Wait for server to actually handle SIGTERM signal
sleep 5
