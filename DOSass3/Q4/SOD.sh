#!/bin/bash

read -p "Enter a 5 digit number: " num

while [ $num -gt 0 ]; do
    digit=$((num % 10))
    sum=$((sum + digit))
    num=$((num / 10))
done 
echo "The sum of digits is: $sum"