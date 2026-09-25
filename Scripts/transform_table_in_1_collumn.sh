#!/bin/bash

# Ensures columns are stacked in order (first column first, second column next, etc.), even if rows have different lengths
# create an item (collumn, space, or what ever you want)

for file in OrthoMCL*.txt;
do awk -F'\t' '  # Explicitly set field separator to TAB
	{
    	for (i=1; i<=NF; i++) {
        	if ($i != "" && $i !~ /^[[:space:]]+$/) {  # Skip empty and whitespace-only fields
            	print $i
        	}
    	}
	}' $file > awk_Method_$file;
done
