# code_dumper.sh

Exclude files and directories:
```sh
 -type f \
        ! -path "$project_dir/.git/*" \                # Exclude the .git directory
        ! -path "$project_dir/tests/*" \               # Exclude the tests directory
        ! -name "docker-compose.yml" \                 # Exclude the docker-compose.yml file
        ! -name "README.md" \                          # Exclude the README.md file
        ! -name "$script_name" | while read -r file; do
        dump_file "$file"
```

Run:
```sh
sh code_dumper.sh .
```
