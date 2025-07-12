#!/Bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python3" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" |tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R error: please run with root access $N " &>>$LOG_FILE
    exit 1
else
    echo "running with root access" &>>$LOG_FILE
fi

#validate function takes input as exit status, and what command they tried to install
VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo -e "Installing $2 is ...$G succcess $N" |tee -a $LOG_FILE
    else    
        echo -e "installing $2 is ...$R failure $N" |tee -a $LOG_FILE
        exit 1
    fi
}

for package in ${PACKAGES[@]}
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then    
        echo "$package is not installed...gng to install" |tee -a $LOG_FILE
        dnf install $package -y
        VALIDATE $? "$package"
    else
        echo -e "ntg to do $package ........$y is already installed $N " |tee -a $LOG_FILE
    fi
done

echo "script ended executing at: $(date)" |tee -a $LOG_FILE 

