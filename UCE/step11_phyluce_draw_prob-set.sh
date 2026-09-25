#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_draw_prob-set
#SBATCH --error=phyluceprob-set.err
#SBATCH --output=phyluceprob-set.out
#SBATCH --partition=short

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate phyluce

cd ~/UCE/actino/probset_design/
phyluce_probe_get_tiled_probes --input Ostei+Hfrancisci+41.fasta --probe-prefix "uce-ostei-" --design osteichthyes-v1 --designer fssalles \
    --tiling-density 4 --two-probes --overlap middle --masking 0.15 --remove-gc \
    --output ~/UCE/Ostei/temp_probes/Ostei+Hfrancisci+41.temp.probes
