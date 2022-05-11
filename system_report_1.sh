#!/usr/bin/env bash
# Task 2

CURRENTDATE=$(date +"%Y-%m-%d_%T")
if [[ ! -z "$1" ]]; then
    OUTPUT_FILENAME="__$1"
else
    OUTPUT_FILENAME="${CURRENTDATE}__system_report_1.txt"
fi



function logAndExecute() {
    DIVIDER=""
    for i in {1..5}; do
        DIVIDER+="-"
    done
    echo $DIVIDER | tee -a $OUTPUT_FILENAME
    echo $1 | tee -a $OUTPUT_FILENAME
    eval $2 | tee -a $OUTPUT_FILENAME
}


echo "Report time $(date)" > $OUTPUT_FILENAME

logAndExecute "System version:" "uname -r"
logAndExecute "Network" "ifconfig"
logAndExecute "/etc/resolv.conf" "cat /etc/resolv.conf"
logAndExecute "ip link:" "ip link"
logAndExecute "Firewall configuration:" "ufw status"
logAndExecute "modprobe.conf" "cat /etc/modprobe.conf"
