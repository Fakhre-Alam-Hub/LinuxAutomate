#!/bin/bash
# Author - ALAM
# CREATED - 10-03-2024

# Script to check the backup file was created today or it was older or no backup file is present.

# font display options
NONE='\033[00m'
RED='\033[31m'
GREEN='\033[32m'
BOLD='\033[1m'
ITALIC='\033[3m'
UNDERLINE='\033[4m'
BLINKING='\033[5m'

# get backup file
filename=$(find /backup -name PanacesMetadata*.sql.gz)

# check if backup file present
if [[ ! -f "$filename" ]]; then
    echo -e "${RED}${BOLD}WARNING! Backup file is not present${NONE}"
    exit 1
fi

Today=$(date +"%Y-%m-%d")
CREATED_DATE=$(date -r "$filename" +"%Y-%m-%d")

if [[ "$Today" == "$CREATED_DATE" ]]; then
    echo "************************************************************"
    echo -e "${GREEN}${BOLD}Backup is taken today - $filename${NONE}"
    echo -e "${GREEN}Today Date:- $Today${NONE}"
    echo -e "${GREEN}File Creation Date:- $CREATED_DATE${NONE}"
    echo "************************************************************"
    echo
else
    echo "************************************************************"
    echo -e "${RED}${BOLD}WARNING! Backup was not taken today(OLD BACKUP) - $filename${NONE}"
    echo -e "${RED}Today Date:- $Today${NONE}"
    echo -e "${RED}File Creation Date:- $CREATED_DATE${NONE}"
    echo "************************************************************"
    echo
fi
