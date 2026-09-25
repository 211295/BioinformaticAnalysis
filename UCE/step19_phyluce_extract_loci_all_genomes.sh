#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_extract_loci
#SBATCH --error=phyluceextract.err
#SBATCH --output=phyluceextract.out
#SBATCH --partition=short

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate phyluce

cd ~/UCE/actino/
phyluce_probe_slice_sequence_from_genomes
	--lastz 2genomes-of-all-species/ --conf old_genome-actino.conf --flank 380
	--name-pattern "2actinopterygii-v1-master-probe-list-DUPE-SCREENED.fasta_v_{}.lastz.clean"
	--output 2genomes-of-all-species/uce-search-results/
	--probe-regex "(\\d+)_p\\d+"

cd ~/UCE/sarco
phyluce_probe_slice_sequence_from_genomes
	--lastz 2genomes-of-all-species --conf sarco/old_ --flank 380
        --name-pattern "2sarcopterygii-v1-master-probe-list-DUPE-SCREENED.fasta_v_{}.lastz.clean"
        --output 2genomes-of-all-species/uce-search-results
