#!/bin/bash

# Read first num
read -p "Enter the first number: " num1 

# Read second num
read -p "Enter the second number: " num2

# Arithmetic operations
SUM=$(expr $num1 + $num2)
DIFF=$(expr $num1 - $num2)
PROD=$(expr $num1 \* $num2)

if [ "$num2" -ne 0 ]; then
    QUOT=$(expr $num1 / $num2)
else
    QUOT="Undefined (division by zero)"
fi

echo "Sum: $SUM"
echo "Difference: $DIFF"
echo "Product: $PROD"
echo "Division: $QUOT"

