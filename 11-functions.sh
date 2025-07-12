#!/Bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "error:please run with root access"
    exit 1
else
    echo "running with root access"
fi

VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo "Installing $2 is ...succcess"
    else    
        echo "installing $2 is ...failure"
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
    echo "mysql is already installed ntg to do"
fi

dnf list installed python3

if [ $? -ne 0 ]
then    
    echo "python3 is not installed...gng to install"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "python3 is already installed ntg to do"
fi

dnf list installed nginx

if [ $? -ne 0 ]
then    
    echo "nginx is not installed...gng to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed ntg to do"
fi

