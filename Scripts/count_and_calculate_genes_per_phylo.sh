#!/bin/bash
### used to count the number of sequences there are in total fasta files in each directory ###
### after make 

for file in [ms]*_final_changed/ e-1[05]_*/
do
	cd $file;
	grep ">" [MS]*_[AS]* > count_number_of_genes.txt;
	cd ../;
done

echo "Print the total number of sequencies in each gene"
wc -l [ms]*_final_changed/count_number_of_genes.txt e-1[05]_*/count_number_of_genes.txt

# Loop over the files
for file1 in [ms]*_final_changed/count_number_of_genes.txt e-1[05]_*/count_number_of_genes.txt
do
    # Ensure the file exists
    if [[ ! -f "$file1" ]]; then
        echo "Error: File '$file1' not found!"
        continue
    fi

    # Count the number of lines with "Sarco_" and divide by 85
    sarco_count=$(grep -c "Sarco_" "$file1")
    sarco_result=$(echo "$sarco_count / 85" | bc -l)

    # Count the number of lines with "Actino_" and divide by 107
    actino_count=$(grep -c "Actino_" "$file1")
    actino_result=$(echo "$actino_count / 107" | bc -l)

    # Output the results for each file
    echo "File: $file1"
    echo "Sarco_ count: $sarco_count, Sarco_ result: $sarco_result"
    echo "Actino_ count: $actino_count, Actino_ result: $actino_result"
    echo "-----------------------"
done
