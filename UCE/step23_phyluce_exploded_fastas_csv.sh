#!/bin/bash

cd ~/UCE/actino/2genomes-of-all-species/taxon-sets
phyluce_assembly_explode_get_fastas_file --input all-taxa-incomplete.fasta --output exploded-fastas --by-taxon
for file in exploded-fastas/*.fasta;
do phyluce_assembly_get_fasta_lengths --input $i --csv ; done

