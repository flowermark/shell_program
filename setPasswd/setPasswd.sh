#!/bin/bash
#author:flowers
#version:v1
#date:2023-11-27

##define dir
user_file=/root/ll/shell-program/data/userinfo.txt

##Verify that the file exists
if [ -f ${user_file} ]
then
	rm -rf ${user_file}
fi

##Verify the mkpasswd tool
if ! which mkpasswd>/dev/null 2>&1
then
	yum install -y expect
fi

##generate a queue
for i in `seq -w 0 09`
do
	##mkpass will generate strings contains uppercase and lowercase letters, numbers, and special characters
        ##-s 0:except special characters
        p=`mkpasswd -l 15 -s 0`
        #create user and add password
        useradd user_${i} && echo "{p}"| passwd --stdin user_${i}
        echo "user_${i} ${p}" >> ${user_file}
done
