#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -n "Enter Ip Server: "
read ip

#ip_local=`ifconfig ens160 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}'`
ip_local=`ifconfig ens160 | grep 'netmask' | awk '{print $2}'`

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
