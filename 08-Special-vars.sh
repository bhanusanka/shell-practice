#!/bin/Bash

echo "Total no of var passed to script: $@"
echo "Number of variables: $#"

echo "Script name:$0"
echo "current directory:$PWD"
echo "USER RUNNING THE SCRIPT:$USER"
echo "Home directory of user:$HOME"
echo "PID of the script:$$"
sleep 10 &
echo "Pid of last command in background:$!"