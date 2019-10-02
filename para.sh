#!/bin/bash
#provided by Alessandro Pezzato via stackoverflow
#https://stackoverflow.com/users/786186/alessandro-pezzato
#found on: https://stackoverflow.com/questions/10909685/run-parallel-multiple-commands-at-once-in-the-same-terminal
#modified by Jessica Ackerman @ScriptnKitten to fit my needs

for cmd in "$@"; do {
	$cmd & pid=$!
	PID_LIST+=" $pid";
} done

trap "kill $PID_LIST" SIGINT
wait $PID_LIST
