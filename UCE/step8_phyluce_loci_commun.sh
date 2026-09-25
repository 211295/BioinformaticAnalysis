#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_loci_commun
#SBATCH --error=phyluceloci.err
#SBATCH --output=phyluceloci.out
#SBATCH --partition=short

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate phyluce

## Search how many loci are shared among species using a genome base
cd ~/UCE/Ostei/alinhamentos/
phyluce_probe_query_multi_merge_table --db general_alignment-Hfrancisci.sqlite  --base-taxon Chondry_Selachii_H_francisci
