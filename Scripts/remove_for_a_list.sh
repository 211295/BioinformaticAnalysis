#!/bin/bash
# Usage: ./remove_for_a_list.sh list_to_remove
### use a list, read a line of the list and use in a loop

while IFS= read -r list_to_remove; do
    # Skip empty lines and comments
    [[ -z "$filename" || "$filename" == \#* ]] && continue

    # Find files in target directories (exact name match)
    find [MS]*[AS]*/ -type f -name "$filename" -print | while read -r list_to_remove; do
        echo "REMOVING: $filepath"
        rm -v "$filepath"  # -v for verification
    done
done < "$1"  # Read from input file
