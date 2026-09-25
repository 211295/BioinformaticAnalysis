#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --time=100:00:00
#SBATCH --mem=60gb
#SBATCH --job-name=IQTREE
#SBATCH --error=iqtree.err
#SBATCH --output=iqtree.out
#SBATCH --partition=long


module load Bio/IQ-TREE/2.3.1

for file in iqtree_*;
do iqtree2 -s $file -mem 60G --threads-max 12 -m MFP -B 1000;
done
