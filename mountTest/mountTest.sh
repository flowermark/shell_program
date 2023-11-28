## write a script check whether the disk partition reads and writes properly
##traverse through all mount points, create new files, and delete them

### -----------------------------Dividing line,The following is the main text---------------
#!/bin/bash
#author:flowers
#version:v1
#date:2023-11-28

##sed delete the first line
##awk '{print $NF}' get last column 
##grep -v filter out ''
for mount_p in `df |sed '1d' |grep -v 'tmpfs' |awk '{print $NF}'`
do
        touch $mount_p/testfile && rm -f $mount_p/testfile
        if [ $? -ne 0 ]
        then
                echo "$mount_p read and write has problem"
        else
                echo "$mount_p read and write no problem"
        fi
done
