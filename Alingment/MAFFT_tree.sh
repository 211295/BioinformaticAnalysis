#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=22:00:00
#SBATCH --mem=30gb
#SBATCH --job-name=MAFFT
#SBATCH --error=mafft.err
#SBATCH --output=mafft.out
#SBATCH --partition=short

./opt/conda/etc/profile.d/conda.sh
conda activate MAFFT
cd ~/final/results/

for file in [AS]*.fasta;
do mafft --maxiterate 1000 --globalpair --treeout --reorder $file > MAFFT/$file.out;
done
