#!/bin/bash

# Prompt user for the first number
read -p "Enter the first number: " num1

# Prompt user for the second number
read -p "Enter the second number: " num2

# Perform arithmetic operations using bc for floating-point arithmetic
sum=$(echo "scale=2; $num1 + $num2" | bc)
difference=$(echo "scale=2; $num1 - $num2" | bc)
product=$(echo "scale=2; $num1 * $num2" | bc)

# Check if the second number is not zero to avoid division by zero
if (( $(echo "$num2 != 0" | bc -l) )); then
    quotient=$(echo "scale=2; $num1 / $num2" | bc)
else
    quotient="Undefined (division by zero)"
fi

# Print the results
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"

