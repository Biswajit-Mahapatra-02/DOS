#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <num1> <num2> <num3>"
    exit 1
fi

num1=$1
num2=$2
num3=$3

if [ "$num1" -lt "$num2" ] && [ "$num1" -lt "$num3" ]; then
    smallest=$num1
elif [ "$num2" -lt "$num1" ] && [ "$num2" -lt "$num3" ]; then
    smallest=$num2
else
    smallest=$num3
fi

echo "The smallest number is: $smallest"
