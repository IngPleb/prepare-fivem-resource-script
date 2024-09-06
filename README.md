# Prepare FiveM Resource Script

A simple yet time saving script for transferring git folders into zips which can be uploaded to KeyMaster.

## Features
- Removes Git-related files like `.git`, `.gitignore`, `.gitattributes`, `.gitmodules`, and `.github`.
- Cleans `.DS_Store` files (common on macOS) and `.vscode` folders.
- Zips the folder after cleanup and deletes the original folder.

## Installation

### 1. Clone the Repository
Clone this repository to your local machine:

```bash
git clone https://github.com/IngPleb/prepare-fivem-resource-script
cd prepare-fivem-resource-script
```

### 2. Make the Script Executable
```bash
chmod +x prepare-fivem-resource.sh
```

### 3. Move Script to `usr/local/bin/`
```bash
mv prepare-fivem-resource.sh /usr/local/bin/prepare-fivem-resource
```

## Usage

```bash
prepare-fivem-resource <path-to-folder-with-resource>
```

## Reason For Existence
*I have created this script to save time when uploading resources to KeyMaster. I have made many revisions and update to private resources and executing these commands one by one became tedious so I made this*