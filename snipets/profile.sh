#!/bin/bash

# Start profile
# PS4='+ $(date "+%s.%N")\011 ' # seconds.nanoseconds
PS4='+ $(date "+%S.%3N")\011 ' # seconds.milliseconds
exec 3>&2 2>/tmp/bashstart.$$.log
set -x

# User proc
ls

echo 111

echo 112

# End profile
set +x
exec 2>&3 3>&-
