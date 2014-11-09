#!/bin/bash
#
# Checks Logged in users.
#
# Date: 09/17/14
# Author: ogawa-masaki
#
# Usage: check-users.sh -w warning_count -c critical_count
#

# input options
while getopts ':w:c:' OPT; do
  case $OPT in
    w)  WARN=$OPTARG;;
    c)  CRIT=$OPTARG;;
  esac
done

WARN=${WARN:=0}
CRIT=${CRIT:=0}

# get user count
COUNT=`w -h | wc -l`

if [ $COUNT -ge $CRIT ] ; then
  echo "Logged in Users Critical - $COUNT"
  exit 2
elif [ $COUNT -ge $WARN ] ; then
  echo "Logged in Users Warning - $COUNT"
  exit 1
else
  echo "Logged in Users OK - $COUNT"
  exit 0
fi
