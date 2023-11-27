### wrote a script that traverses the txt file in /data/
### back up this txt files
### Add a year, month, and day suffix to the backup file to the backup file,eg:flower.txt --->flower.txt_20231001

### -----------------------------Dividing line,The following is the main text---------------

#!/bin/bash
#author:flowers
#version:v1
#date:2023-09-06

##Define suffix variables
suffix=`date +%Y%m%d`
original_dir=/root/ll/shell-program/data
backup_dir=/root/ll/shell-program/data_backup

##create backup dir
if [ ! -d ${backup_dir} ]; then
  mkdir -p ${backup_dir}
  echo "Successfully create /root/ll/shell-program/data_backup"
fi

##find the txt file in the /data/ directory and traverse with a for loop
for f in `find ${original_dir} -type f -name "*.txt"`
do
    echo "back up $f"
    cp ${f} ${f}_${suffix}
    cp ${f}_${suffix} ${backup_dir}
    rm -R ${f}_${suffix}
done
