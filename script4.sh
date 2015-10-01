#!/bin/bash

if [ -z $1 ] || [ ${#1} -lt 4 ]
then
    echo "Please, specify process you'd like to look for, it's length should be at least 4 symbols"
    exit
fi

while true
do
    pidList=$(pgrep $1)
    for pid in $pidList
    do
        cpuLoad=$(ps S -p $pid -o pcpu= | sed -e 's/^[ \t]*//')
        if expr $cpuLoad '>' 5.0 1>/dev/null
        then
            echo "$1 process with $pid pid is too greedy, it produce ${cpuLoad}% CPU load "
        fi
    done
    sleep 10
done