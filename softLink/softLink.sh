#!/bin/bash
#author:flowers
#version:v1
#date:2023-11-30

##define main func
main()
{
	cd /data/att
	for dir in `ls`
	do
		##-mtime restrict before 365 day
		for dir2 in `find $dir -maxdepth 1 -type d -mtime +365`
		do 
			##-R create dir structure
			rsync -aR $dir2/ /data1/att
			if [ $? -eq 0 ]
			then 
				rm -rf $dir2
				echo "/data/att/$dir2 move successfully"
				##soft link
				ln -s /data1/att/$dir2 /data/att/$dir2 && \
				echo "soft link create successfully"
				echo
			else
				echo "failed !!!"
			fi
		done
	done
}
main
main &> /root/ll/shell-program/log/move_old_data_`date +%F`.log