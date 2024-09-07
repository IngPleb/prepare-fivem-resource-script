#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ $# -eq 0 ]; then
    echo -e "${RED}Please provide a folder as an argument${NC}"
    exit 1
fi

folder=$1
destination=${2:-.}

if [ ! -d "$folder" ]; then
    echo -e "${RED}Error: The provided folder does not exist${NC}"
    exit 1
fi

echo -e "${GREEN}Counting lines in plain text files within the folder${NC}"

line_count=0

# Recursively count lines in plain text files
while IFS= read -r -d '' file; do
    if [[ "$file" == *".lua" || "$file" == *".js" ]]; then
        lines=$(wc -l < "$file")
        line_count=$((line_count + lines))
    fi
done < <(find "$folder" -type f -print0)

echo "Total lines in plain text files: $line_count"

echo -e "${GREEN}Done${NC}"
exit 0
