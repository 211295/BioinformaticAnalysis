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

cd ~/UCE/Ostei/alinhamentos/beds ;
phyluce_probe_get_genome_sequences_from_bed --bed Ostei+Hfrancisci+41.bed --twobit ~/UCE/Ostei/Chondry_Selachii_H_francisci/Chondry_Selachii_H_francisci.2bit \
        --buffer-to 140 --output ~/UCE/Ostei/probset_design/Ostei+Hfrancisci+41.fasta

