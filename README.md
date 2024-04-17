# LinuxAutomate

### This repository contains Linux automation codes scripts

### File:- mount_point_details.sh
Script to get the mount point space usage 

### File:- check_backup.sh
Script to check the backup file was created today or it was older or no backup file is present.

### Linux command to check the user password expiring in upcoming 7 days
ED=$(chage -l <username>|grep 'Password expires'|awk '{print $4,$5,$6}');TD=$(date -d '+7days' +%m/%d/%Y);if [[ $(date -d "$ED" +%s) < $(date -d "$TD" +%s) ]];then echo -e "\033[31mUnsafe- $ED\033[0m";else echo -e "\033[32mSafe - $ED\033[0m";fi
