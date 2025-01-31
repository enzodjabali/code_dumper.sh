#!/bin/bash

# Function to dump file content with path
dump_file() {
    local file_path="$1"
    echo "$file_path:"
    cat "$file_path"
    echo -e "\n"
}

# Main script
dump_project() {
    local project_dir="$1"
    local script_name="$(basename "$0")"  # Get the name of the current script

    # Check if the directory exists
    if [[ ! -d "$project_dir" ]]; then
        echo "Error: Directory $project_dir does not exist."
        exit 1
    fi

    # Recursively find all files excluding specific folders and files, then dump their content
    find "$project_dir" \
        -type f \
        ! -path "$project_dir/.git/*" \
        ! -path "$project_dir/SwiftUITests/*" \
        ! -path "$project_dir/SwiftUIMapUITests/*" \
        ! -name "docker-compose.yml" \
        ! -name "README.md" \
        ! -name "$script_name" | while read -r file; do
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
