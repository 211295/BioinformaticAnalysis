#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --time=24:00:00
#SBATCH --mem=30gb
#SBATCH --job-name=IQTREE
#SBATCH --error=iqtreeS.err
#SBATCH --output=iqtreeS.out
#SBATCH --partition=short


module load Bio/IQ-TREE/2.3.1

for file in iqtree_Sarco_*.fasta;
do iqtree2 -s $file -mem 30G --threads-max 10 -m MFP -B 1000;
done
