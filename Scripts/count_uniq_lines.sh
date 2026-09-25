#!/bin/bash

# Step 1: Extract the first column from the input file and get unique lines
awk '{print $1}' Sarco_Coelacanth_L.chalumnae_blast_muc1.out | uniq > uniq_lines_of_lines.txt

# Step 2: Count occurrences of each unique line in the FASTA file
# Loop through each unique line in uniq_lines_of_file.txt
while read -r line; do
    # Count occurrences of the line in the fasta file
    occurrences=$(grep -c "$line" ~/Ostei/cds.fna/Sarco_Coelacanth_L.chalumnae_cds.fna)

    # Write the result to count_uniq_lines.txt
    echo "$line = $occurrences times" >> count_uniq_lines.txt
done < uniq_lines_of_file.txt

# Notify the user
echo "Occurrences of unique lines have been written to 'count_uniq_lines.txt'."
