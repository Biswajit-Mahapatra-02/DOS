#!/bin/bash

read -p "Enter a day (e.g. Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday): " day

case "$day" in
    "Monday") echo "DOS class on $day: 10am to 12pm, Lab D101"
        ;;
    "Thursday") echo "DOS class on $day: 10am to 11am, Room C19"
        ;;
    "Friday") echo "DOS class on $day: 1pm to 2pm, Room C19"
        ;;
    "Saturday") echo "DOS class on $day: 9am to 10am, Room C19"
        ;;
    "Sunday") echo "Holiday"
        ;;
    *) echo "No class on $day"
        ;;
esac
