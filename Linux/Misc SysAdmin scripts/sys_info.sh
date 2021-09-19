#!/bin/bash

mkdir !/research 2> /dev/null

filename="sys_info.txt"
echo "Sys_Info report" > $filename
date >> $filename
echo "Machine Type Info:" >> $filename
echo $MACHTYPE >> $filename
echo -e "Uname info: $(uname -a) \n >> $filename"
echo -e "IP info: $(ip addr | grep inet | head -9 | tail -1) \n"
#echo -e "$(hostname -l | awk '{print $1}')"
echo -e "Hostname: $(hostname -s) "
echo -e "\n777 Files:" >> $filename
find / -type f -perm 777 > $filename
echo -e "\nTop 10 Processes" >> $filename
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $filename



# echo -e "The files in $PWD are: \n$(ls)"
#  -e allows for string formatting including carriage returns \n"
