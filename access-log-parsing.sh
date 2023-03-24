#!/bin/bash

if [ -z "$1" ]
then
    echo "Usage: $0 <logfile>"
    exit 1
fi

logfile="$1"

echo "Count   Status   URL" > output.txt
awk '$9 == 404 {print $7, $9}' "$logfile" | sort | uniq -c | awk '{ printf "%-7s%-9s%s\n", $1, $3, $2 }' | awk 'BEGIN {print "# 404 errors in access.log\n# Columns: Count, Status Code, URL\n#---------------------------------------------------"} {print}' >> output.txt
echo "Total: $(awk '$9 == 404 {print $7}' "$logfile" | wc -l)" >> output.txt

