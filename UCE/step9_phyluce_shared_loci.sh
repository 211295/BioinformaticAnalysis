#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_shared_loci
#SBATCH --error=phyluceshared.err
#SBATCH --output=phyluceshared.out
#SBATCH --partition=short

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate phyluce

# ouput only those conserved loci that we’ve identified as being shared between the base genome and all exemplars

cd ~/UCE/Ostei/alinhamentos/beds/;
phyluce_probe_query_multi_merge_table --db general_alignment-Hfrancisci.sqlite --base-taxon Chondry_Selachii_H_francisci \
        --output beds/Ostei+Hfrancisci+41.bed --specific-counts 30
