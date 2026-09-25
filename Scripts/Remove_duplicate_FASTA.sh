#!/bin/bash
### Print FASTA records (descriptions and sequences) from a file. Print only the first record for a given FASTA ID 
### (everything on the description line up to the first space). 
### So if a record has an already-printed ID with a different text description, it will still not be printed.

for file in [AS]*;
do
perl -e '
$unique=0;
$total=0;
while(<>) {
    if (/^>\S+/) {
	$total++;
	if (! ($seen{$&}++)) {
	    $unique++;
	    $print_it = 1
	}
	else {
	    $print_it = 0
	}
	
    };
    if ($print_it) {
	print $_
    };
}
warn "\nChose $unique unique FASTA records out of $total total.\n\n";
' $file  > removed_duplicate_$file;
done
