#!/bin/bash

if [ -z "$1" ]
then
    echo "Usage: $0 <logfile>"
    exit 1
fi

logfile="$1"

echo "Count   URL             Status" > output.txt
awk '$9 == 404 {print $7 "       " $9}' "$logfile" | sort | uniq -c | awk '{ printf "%-7s%-16s%s\n", $1, $2, $3 }' | column -t >> output.txt
echo "Total: $(awk '$9 == 404 {print $7}' "$logfile" | wc -l)" >> output.txt
