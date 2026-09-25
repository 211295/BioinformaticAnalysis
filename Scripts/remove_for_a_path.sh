#!/bin/bash
# Usage: ./remove_files.sh [list_type] [file_list.txt]
# list_type: "path" (full paths)
### construct a list of files in diferente directories in a list to be readed
        # Remove files by full path (directly from list)
        while IFS= read -r to_remove; do
            # Skip empty lines/comments
            [[ -z "to_remove" || "$to_remove" == \#* ]] && continue

            # Validate path exists and is a file (not a directory/symlink)
            if [[ -f "$to_remove" ]]; then
                echo "REMOVING: $to_remove"
                rm -v "$to_remove"
            else
                echo "WARNING: Not a file or does not exist - '$to_remove'" >&2
            fi
        done < "$to_remove"
