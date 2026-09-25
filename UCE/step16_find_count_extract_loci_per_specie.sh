#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_removing_duplicates
#SBATCH --error=phylucefindcountextract.err
#SBATCH --output=phylucfindcountextract.out
#SBATCH --partition=short

cd ~/UCE
phyluce_probe_get_multi_fasta_table --fastas 2genome-actino-lastz/2genome-actino-fasta/ #directory with the fastas
	--output 2genome-actino-lastz/2genome-actino-fasta/2general_alignment-all.sqlite
	--base-taxon Actino_Poly_E_calabarius

phyluce_probe_query_multi_fasta_table
	--db 2genome-actino-lastz/2genome-actino-fasta/2general_alignment-all.sqlite #sqlite file
	--base-taxon Actino_Poly_E_calabarius

phyluce_probe_query_multi_fasta_table
	--db 2genome-actino-lastz/2genome-actino-fasta/2general_alignment-all.sqlite #sqlite file
	--base-taxon Actino_Poly_E_calabarius
	--output 2genome-actino-lastz/2genome-actino-fasta/Actino21-back-to-10.conf #.conf
	--specific-counts 10

phyluce_probe_get_multi_fasta_table --fastas 2genome-sarco-lastz/2genome-sarco-fasta/ #directory with the fastas
        --output 2genome-sarco-lastz/2genome-sarco-fasta/2general_alignment-all.sqlite
        --base-taxon Sarco_Coelacanth_L_chalumnae

phyluce_probe_query_multi_fasta_table
        --db 2genome-sarco-lastz/2genome-sarco-fasta/2general_alignment-all.sqlite #sqlite file
        --base-taxon Sarco_Coelacanth_L_chalumnae

phyluce_probe_query_multi_fasta_table
        --db 2genome-sarco-lastz/2genome-sarco-fasta/2general_alignment-all.sqlite #sqlite file
        --base-taxon Sarco_Coelacanth_L_chalumnae
        --output 2genome-sarco-lastz/2genome-sarco-fasta/Sarco16-back-to-12.conf #.conf
        --specific-counts 12
