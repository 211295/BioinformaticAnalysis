#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_extract_loci
#SBATCH --error=phylucematrixall.err
#SBATCH --output=phylucematrixall.out
#SBATCH --partition=short

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate phyluce

phyluce_assembly_get_match_counts --locus-db actino/2genomes-of-all-species/uce-search-fastas/filtred/probe.matches.sqlite
	--taxon-list-config actino/2genomes-of-all-fasta/taxon-sets/all_taxon-sets.conf
	--taxon-group 'all'
	--incomplete-matrix
	--output actino/2genomes-of-all-species/taxon-sets/all-taxa-incomplete.conf

phyluce_assembly_get_match_counts --locus-db sarco/2genomes-of-all-species/uce-search-fastas/filtred/probe.matches.sqlite
        --taxon-list-config sarco/2genomes-of-all-fasta/taxon-sets/all_taxon-sets.conf
        --taxon-group 'all'
        --incomplete-matrix
        --output sarco/2genomes-of-all-species/taxon-sets/all-taxa-incomplete.conf
