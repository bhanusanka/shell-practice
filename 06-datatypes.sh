#!/bin/Bash

number1=100
number2=200

TIMESTAMP=$(date)

echo "script executed at $TIMESTAMP"
sum=$(($number1+$number2))
echo "sum of num1 and num2 is: $sum"