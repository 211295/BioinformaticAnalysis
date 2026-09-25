#!/bin/bash

# Count the number of words per line and save in a new file

for file in sftp*.filt* ;
do
	while IFS= read -r line;
		do echo "$line" | wc -w ;
		done < $file > count_per_line_$file;
done
