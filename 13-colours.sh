#!/Bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R error: please run with root access $N "
    exit 1
else
    echo "running with root access"
fi

#validate function takes input as exit status, and what command they tried to install
VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo -e "Installing $2 is ...$G succcess $N"
    else    
        echo -e "installing $2 is ...$R failure $N"
        exit 1
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then    
    echo "mysql is not installed...gng to install"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e "ntg to do mysql ........$y is already installed $N "
fi

dnf list installed python3

if [ $? -ne 0 ]
then    
    echo "python3 is not installed...gng to install"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "ntg to do python3......$y is already installed $N"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then    
    echo "nginx is not installed...gng to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "ntg to do nginx ......$y is already installed $N "
fi

