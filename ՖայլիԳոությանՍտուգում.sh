#!/bin/bash
file="example.txt"
if [[ -f "$file" ]]; then
    echo "$file գոյություն ունի"
else
    echo "$file գոյություն չունի"
fi
