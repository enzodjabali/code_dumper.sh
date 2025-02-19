#!/bin/bash

# Variables for excluded directories and files
SCRIPT_NAME=$(basename "$0")
EXCLUDED_DIRS=(
    ".git"
    "SwiftUITests"
    "SwiftUIMapUITests"
    "img"
    "libs"
)
EXCLUDED_FILES=(
    "docker-compose.yml"
    "README.md"
    "$SCRIPT_NAME"
)

dump_file() {
    local file_path="$1"
    echo "$file_path:"
    cat "$file_path"
    echo ""
    echo "-----------------------------------------------------------------------------------------------------------------"
}

dump_project() {
    local project_dir="$1"

    # Check if the directory exists
    if [[ ! -d "$project_dir" ]]; then
        echo "Error: Directory $project_dir does not exist."
        exit 1
    fi

    # Build the exclusion arguments for find
    local exclude_args=()
    for dir in "${EXCLUDED_DIRS[@]}"; do
        exclude_args+=( ! -path "$project_dir/$dir/*" )
    done
    for file in "${EXCLUDED_FILES[@]}"; do
        exclude_args+=( ! -name "$file" )
    done

    # Recursively find all files excluding specific folders and files, then dump their content
    find "$project_dir" -type f "${exclude_args[@]}" | while read -r file; do
        dump_file "$file"
    done
}

# Check if project directory is provided
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <project_directory>"
    exit 1
fi

# Execute the dump
dump_project "$1"
