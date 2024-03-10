#!/bin/bash
# Author - ALAM
# CREATED - 10-03-2024

# Script to get the mount point space usage 

# font display options
NONE='\033[00m'
RED='\033[31m'
GREEN='\033[32m'
BOLD='\033[1m'
ITALIC='\033[3m'
UNDERLINE='\033[4m'
BLINKING='\033[5m'

# get mount point usage details
function calculate_details (){
    TOTAL=$(df -hT $1 | awk 'NR > 1 {print $3}')
    USED=$(df -hT $1 | awk 'NR > 1 {print $4}')
    AVAILABLE=$(df -hT $1 | awk 'NR > 1 {print $5}')
    USED_PERC=$(df -hT $1 | awk 'NR > 1 {print $6}')
    USED_PERC_N=$(df -hT $1 | awk 'NR > 1 {print $6}' | awk '{ print substr( $0, 1, length($0)-1) }')
}

# display the space usage of mount ponit
function show_details (){
    echo "*****************************"
    echo -e "$1${BOLD}MOUNT_POINT - $2${NONE}"
    echo "*****************************"
    echo "----------------------------"
    echo -e "$1TOTAL SIZE - $TOTAL${NONE}"
    echo -e "$1USED SPACE - $USED${NONE}"
    echo -e "$1${BOLD}AVAILABLE SPACE - $AVAILABLE${NONE}"
    echo -e "$1USED SPACE IN PERCENT - $USED_PERC${NONE}"
    echo -e "$1THRESHOLD SPACE IN PERCENT - $3%${NONE}"
    echo "----------------------------" 
    echo
    # reset font
    tput sgr0
}

# get the details and show
function get_details (){
    calculate_details $1
    THRESHOLD=90

    if [[ $USED_PERC_N  -ge $THRESHOLD ]]; then
        show_details ${RED} $1 $THRESHOLD
    else
        show_details ${GREEN} $1 $THRESHOLD
    fi
}

# get details of /opt mount point
MOUNT_POINT=/opt/
get_details $MOUNT_POINT

# get details of /boot mount point
MOUNT_POINT=/backup/
get_details $MOUNT_POINT
