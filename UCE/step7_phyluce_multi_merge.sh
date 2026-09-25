#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_multi_merge
#SBATCH --error=phylucemerge.err
#SBATCH --output=phylucemerge.out
#SBATCH --partition=short

# The [beds] line is the “header” line, and that is followed by each taxon name (on the left OF ':')
# The name of the BAM.BED.SORTED.MERGED.STRIPED file want to process (on the right OF ':'). Place this file in the bed directory.

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate phyluce

cd ~/UCE/Ostei/alinhamentos/
phyluce_probe_get_multi_merge_table --conf beds/bed-ostei.conf --base-taxon Chondry_Selachii_H_francisci --output general_alignment-Hfrancisci.sqlite
