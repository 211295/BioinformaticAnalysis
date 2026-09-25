#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_extract_loci
#SBATCH --error=phylucematchcontigs.err
#SBATCH --output=phylucematchcontigs.out
#SBATCH --partition=short

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate phyluce

cd ~/UCE
phyluce_assembly_match_contigs_to_probes --contigs actino/2genomes-of-all-species/uce-search-fastas/
	--probes 2genome-actino-lastz/2genome-actino-fasta/2actinopterygii-v1-master-probe-list-DUPE-SCREENED.fasta
	--output actino/2genomes-of-all-species/uce-search-fastas/filtred --regex "(\\d+)_p\\d+"

phyluce_assembly_match_contigs_to_probes --contigs sarco/2genomes-of-all-species/uce-search-results
        --probes 2genome-sarco-lastz/2genome-sarco-fasta/2sarcopterygii-v1-master-probe-list-DUPE-SCREENED.fasta
        --output sarco/2genomes-of-all-species/uce-search-results/filtred --regex "(\\d+)_p\\d+"
