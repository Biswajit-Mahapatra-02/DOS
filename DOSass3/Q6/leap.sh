#!/bin/bash

if [ $# -eq 1 ]; then
    year=$1
else
    year=$(date +%Y)
fi

if (( ($year % 4 == 0 && $year % 100 != 0) || ($year % 400 == 0) )); then
    echo "$year is a leap year"
else
    echo "$year is not a leap year"
fi