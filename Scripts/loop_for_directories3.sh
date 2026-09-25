#!/bin/bash

# Use for a loop using directories
# Need to acoplate 'if' logical command and 'then'

for dir in [MS]*[AS]*/;
do          # Note the trailing '/' to match only directories
  if [ -d "$dir" ]; then            # Check if it's a directory
    cd "$dir" || continue           # Enter dir || skip if failed
    for file in *.txt; do           # Process all .txt files
      if [ -f "$file" ]; then       # Check if file exists
        awk -F "|" '{print $1}' $file | sort -u > uniq_specie_$file # Count number of species
      fi
    done
    cd ..                           # Return to parent directory
  fi
done
