#!/Bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

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

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then    
    echo "mysql is not installed...gng to install" |tee -a $LOG_FILE
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e "ntg to do mysql ........$y is already installed $N " |tee -a $LOG_FILE
fi

dnf list installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]
then    
    echo "python3 is not installed...gng to install" |tee -a $LOG_FILE
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "ntg to do python3......$y is already installed $N" |tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE

if [ $? -ne 0 ]
then    
    echo "nginx is not installed...gng to install" |tee -a $LOG_FILE
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "ntg to do nginx ......$y is already installed $N " |tee -a $LOG_FILE
fi

echo "script ended executing at: $(date)" |tee -a $LOG_FILE 

