#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_removing_duplicates
#SBATCH --error=phyluceextractsequence.err
#SBATCH --output=phyluceextractsequence.out
#SBATCH --partition=short

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate phyluce

cd ~/UCE/Ostei/
phyluce_probe_slice_sequence_from_genomes
	--conf actino/show_genome-actino.conf --lastz actino/genome-actino-lastz/
	--name-pattern "Actino+Poly+20.temp-DUPE-SCREENED.probes_v_{}.lastz.clean"
	--probe-regex "uce-actino(\\d+)_p\\d+" --probes 150
	--output ~/UCE/actino/genome-actino-lastz/genome-actino-fasta/

cd ~/UCE/sarco/probset_design/
phyluce_probe_slice_sequence_from_genomes --conf ~/UCE/actino/genome-actino.conf --lastz genome-actino-lastz \
    --probes 150 --name-pattern "Coelacanth+20.temp-DUPE-SCREENED.probes_v_{}.lastz.clean" \
    --probes-reges "uce-sarco(\\d+)_p\\d+"
    --output ~/actino/probset_design/genome-actino-fasta
