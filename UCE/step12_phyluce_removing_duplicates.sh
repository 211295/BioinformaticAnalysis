#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_removing_duplicates
#SBATCH --error=phyluceremoving.err
#SBATCH --output=phyluceremoving.out
#SBATCH --partition=short

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate phyluce

cd ~/UCE/Ostei
phyluce_probe_easy_lastz --target temp_probes/Ostei+Hfrancisci+41.temp.probes --query temp_probes/Ostei+Hfrancisci+41.temp.probes \
    --identity 40 --coverage 70 \
    --output temp_probes/Ostei+Hfrancisci+41.temp.probes-TO-SELF-PROBES.lastz
phyluce_probe_remove_duplicate_hits_from_probes_using_lastz --fasta temp_probes/Ostei+Hfrancisci+41.temp.probes  \
    --lastz temp_probes/Ostei+Hfrancisci+41.temp.probes-TO-SELF-PROBES.lastz --probe-prefix=uce-ostei-
