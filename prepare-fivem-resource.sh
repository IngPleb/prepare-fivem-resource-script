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

if [ -n "$(find "$folder" -name "*.zip" -type f)" ]; then
    echo -e "${RED}Error: Folder contains zip files${NC}"
    exit 1
fi

if [ ! -w "$folder" ]; then
    echo -e "${RED}Error: No write permissions for the folder${NC}"
    exit 1
fi

echo -e "${GREEN}Removing all GIT related stuff from this folder${NC}"

rm -rf "$folder/.git"
echo "Removed .git folder"
rm -rf "$folder/.gitignore"
echo "Removed .gitignore file"
rm -rf "$folder/.gitattributes"
echo "Removed .gitattributes file"
rm -rf "$folder/.gitmodules"
echo "Removed .gitmodules file"
rm -rf "$folder/.github"
echo "Removed .github folder"

# Removing all .DS_Store files
find "$folder" -name ".DS_Store" -type f -delete
echo "Removed all .DS_Store files"

# Removing all .vscode files
find "$folder" -name ".vscode" -type d -exec rm -rf {} +
echo "Removed all .vscode folders"

# Zipping the folder
if zip -r "$(basename "$folder").zip" "$folder"; then
    echo "Zipped the folder successfully"
    mv "$(basename "$folder").zip" "$destination"
    echo "Zipped folder saved to $destination"
else
    echo -e "${RED}Error: Failed to create the zip file${NC}"
    exit 1
fi

read -p "Are you sure you want to delete the folder after zipping? (y/n): " confirm
if [ "$confirm" != "y" ]; then
    echo "Aborting deletion"
    exit 0
fi

echo "Cleaning up"
rm -rf "$folder"

echo -e "${GREEN}Done${NC}"
exit 0