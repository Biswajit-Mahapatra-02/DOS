#!/bin/bash

# Function to calculate gross salary
calculate_gross_salary() {
    local basic_salary=$1
    dearness_allowance=$(echo "scale=2; 0.4 * $basic_salary" | bc)
    house_rent_allowance=$(echo "scale=2; 0.2 * $basic_salary" | bc)
    gross_salary=$(echo "scale=2; $basic_salary + $dearness_allowance + $house_rent_allowance" | bc)
    
    echo $gross_salary
}

read -p "Enter Ramesh's basic salary: " basic_salary
gross_salary=$(calculate_gross_salary $basic_salary)
echo "Ramesh's gross salary is: $gross_salary"
