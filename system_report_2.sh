#!/usr/bin/env bash
# Task 3

CURRENTDATE=$(date +"%Y-%m-%d_%T")
if [[ ! -z "$1" ]]; then
    OUTPUT_FILENAME="__$1"
else
    OUTPUT_FILENAME="${CURRENTDATE}__system_report_2.txt"
fi



function logAndExecute() {
    DIVIDER=""
    for i in {1..5}; do
        DIVIDER+="-"
    done
    echo $DIVIDER | tee -a $OUTPUT_FILENAME
    echo $1 | tee -a $OUTPUT_FILENAME
    $2 | tee -a $OUTPUT_FILENAME
}


echo "Report time $(date)" > $OUTPUT_FILENAME

logAndExecute  "Uptime:" uptime
logAndExecute "Current users:" who
logAndExecute "Last 10 logins:" "last | head -n 10"
logAndExecute "TOP-10 processes by RAM/CPU usage:" "ps -axrm | head -n 10"
logAndExecute "Open TCP/UDP ports" "netstat -tul | grep LISTEN"
logAndExecute "Virtual Memory usage"  "free -th | grep swap -i"
logAndExecute "Disk Usage" "df -hl /"


