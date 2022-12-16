#!/bin/sh
# set -e
# cd $(dirname $0)/

watch_path=$1
shift
cmd=$@

last_executed_time=0

while [ 1 ]
do
    last_changed_file=$(find $watch_path -type f -printf "%T@ %p\n" | sort -n | cut -d' ' -f 2- | tail -n 1)
    last_changed_time=$(date -r $last_changed_file +"%s%9N")
    if [ $last_changed_time -gt $last_executed_time ]
    then
        last_executed_time=$(date +"%s%9N")
        $cmd
    else
        sleep 0.1
    fi
done
