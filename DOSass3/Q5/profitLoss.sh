#!/bin/bash

read -p "Enter cost price: " CP
read -p "Enter selling price: " SP

if (( $(echo "$SP > $CP" | bc -l) )); then
        profit=$(echo "$SP - $CP" | bc -l)
        echo "The seller made a profit of $profit"
    elif (( $(echo "$SP == $CP" | bc -l) )); then
        echo "The seller broke even (no profit or loss)"
    else
        loss=$(echo "$CP - $SP" | bc -l)
        echo "The seller incurred a loss of $loss"
fi