#!/bin/sh
# set -e
# cd $(dirname $0)/

$2

while [ 1 ]
do
    last_changed_file=$(find $1 -type f -printf "%T@ %p\n" | sort -n | cut -d' ' -f 2- | tail -n 1)
    seconds_since_change=$(($(date +%s) - $(date -r $last_changed_file +%s)))
    if [ $seconds_since_change -lt 3 ]
    then
        $2 &
        sleep 3 &
        wait
    else
        sleep 1
    fi
done
