#!/usr/bin/env bash
# Task 1

# Usage:
# ./scirpt command arg1 arg2 ..

# First cheching if we have a process name to work with 
if [[ -z "$1" ]]; then
	echo "Pass a process name as the first parameter"
	exit
fi



echo "Searching for process $1"
PROCESS_INFO=$(ps -axc | grep $1)
# ps -axc meaning:
# -ax displays all processes with or without contolling terminal
# -c  dispays name of the process without command line 
# (otherwise we would found our command to start the script itself)

# cheching if the last output is empty / non-empty
if [ $? == 0 ]; then
	echo "The process $1 is running. Printing info"
	echo $PROCESS_INFO
else
	echo "The process $1 is not running. Statring it now..."
	# executing command with all arguments
	$@
fi

exit
