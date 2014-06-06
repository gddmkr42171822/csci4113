#!/usr/bin/env bash
# This creates the dashboard specified in the lab1 write-up.
echo
echo CPU AND MEMORY RESOURCES--------------------------
ram=$(free -m | tr -s " " | cut -d" " -f4 | tail -n 3 | head -n 1)
load=$(uptime | cut -d, --fields=3,4,5 | cut -d: -f2)
echo "CPU Load Average:$load	Free RAM: $ram MB"
echo
echo NETWORK CONNECTIONS------------------------
ethrx=$(ifconfig | tr -s " " | cut -d" " -f3 | cut -d: -f2 | head -n 8 | tail -n 1)
ethtx=$(ifconfig | tr -s " " | cut -d" " -f7 | cut -d: -f2 | head -n 8 | tail -n 1)
lorx=$(ifconfig | tr -s " " | cut -d" " -f3 | cut -d: -f2 | tail -n 2 | head -n 1)
lotx=$(ifconfig | tr -s " " | cut -d" " -f7 | cut -d: -f2 | tail -n 2 | head -n 1)
intconnect=$(ping -c 1 8.8.8.8 | cut -d, -f2 | cut -d" " -f2 | tail -n 2 | head -n 1)
intbool="No"
if [ $intconnect -gt "0" ]
then
	intbool="Yes"
fi
echo "Io Bytes Received: $lorx	Bytes Transmitted: $lotx"
echo "eth0 Bytes Received: $ethrx	Bytes Transmitted: $ethtx"
echo "Internet Connectivity: $intbool"
echo
echo ACCOUNT INFORMATION--------------------------
totalusrs=$(cat /etc/passwd | cut -d: -f1 | wc -w)
freqshell=$(cat /etc/passwd | cut -d: -f7 | sort | uniq -c | sort -g | tail -n 1 | tr -s " " | cut -d" " -f3)
activeusr=$(who | cut -d" " -f1 | sort | uniq | wc -w)
echo "Total Users: $totalusrs		Number Active: $activeusr"
echo "Most Frequently Used Shell: $freqshell"
echo
