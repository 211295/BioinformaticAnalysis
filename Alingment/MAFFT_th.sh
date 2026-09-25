#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=100:00:00
#SBATCH --mem=20gb
#SBATCH --job-name=mafft
#SBATCH --error=mafft.err
#SBATCH --output=mafft.out
#SBATCH --partition=long

cd /home/fssalles/final/results/

for file in OGs_* ; do
	cd $file/phylopypruner_output;
	for file2 in *.fasta ; do
		~/final/MAFFT_Linux/mafft-linux64/mafft.bat --thread 20 --leavegappyregion --reorder --maxiterate 1000 --globalpair $file2 > $file2.aligned ;
		done;
	cd ../../;
done
