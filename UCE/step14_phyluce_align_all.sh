#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_probeset
#SBATCH --error=phylucealingall.err
#SBATCH --output=phylucealingall.out
#SBATCH --partition=short

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate phyluce

#Extracting the sequencies
cd ~/UCE/Ostei/
phyluce_probe_slice_sequence_from_genomes --conf ostei-genome.conf
	--lastz ~/UCE/Ostei/genome-actino.lastz --probes 150
	--name-pattern "Ostei+Hfrancisci+41.temp-DUPE-SCREENED.probes_v_{}.lastz.clean" \
	--output ~/UCE/Ostei/genome-lastz/genome-ostei-fastas/
