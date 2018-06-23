#!/bin/bash
# Program name: ip.sh
( date
cat ippool.txt |  while read output
do
    ping -c 1 "$output" > /dev/null
    if [ $? -eq 0 ]; then
    echo "node $output is up" 
    echo "$output" >> final_ip.txt
    else
    echo "node $output is down"
    fi
done ) | tee log.txt