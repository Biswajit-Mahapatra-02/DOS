#!/bin/bash

read -p "Enter marks: " mark
read -p "Enter attendance percentage: " att
att=$(echo "scale=2; $att / 100" | bc)
echo "$mark"
echo "$att"

if (( $(echo "$mark >= 20" | bc -l) && $(echo "$att >= 0.75" | bc -l) )); then
    echo "Allowed for semester"
else
    echo "Not allowed"
fi