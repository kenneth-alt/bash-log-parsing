#!/bin/bash

# Check if the filename argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 1
fi

# Run the command
sort -k11nr "$1" | awk '{if (($5 !~ /^192\.168\./)) print $5, $10}' | head -n 20
