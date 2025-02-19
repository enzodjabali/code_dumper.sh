# code_dumper.bash

Exclude files and directories:
```bash
# Variables for excluded directories and files
SCRIPT_NAME=$(basename "$0")
EXCLUDED_DIRS=(
    ".git"                      # Exclude the .git directory
    "SwiftUITests"              # Exclude the SwiftUITests directory
    "SwiftUIMapUITests"         # Exclude the SwiftUIMapUITests directory
)
EXCLUDED_FILES=(
    "docker-compose.yml"        # Exclude the docker-compose.yml file
    "README.md"                 # Exclude the README.md file
    "$SCRIPT_NAME"
)
```

Run:
```sh
bash code_dumper.bash .
```
