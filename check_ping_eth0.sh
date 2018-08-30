#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -n "Enter Ip Server: "
read ip

ip_local=`ifconfig eth0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}'`

year=$(date +"%Y")
month=$(date +"%-m")
day=$(date +"%-d")
address=$ip
ymd=$year$month$day

logPath="$CURRENT_DIR/check_ping_from_"$ip_local"_to_$ip.log"

ping $ip | while read pong;
                do

                        echo "$(date): $pong";
                done >> $logPath 2>&1 &
