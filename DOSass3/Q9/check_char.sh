#!/bin/bash

read -p "Enter a character: " char

if [[ ${#char} -gt 1 ]]; then
    echo "You have entered more than one character."
elif [[ $char =~ [0-9] ]]; then
    echo "You have entered a digit."
elif [[ $char =~ [[:lower:]] ]]; then
    echo "You entered a lower case alphabet."
elif [[ $char =~ [[:upper:]] ]]; then
    echo "You entered an upper case alphabet."
else
    echo "You have entered a special symbol."
fi
