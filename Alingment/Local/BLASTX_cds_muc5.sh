#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=BLASTX5
#SBATCH --error=blastx.err
#SBATCH --output=blastx.out
#SBATCH --partition=short

cd ~/Ostei/cds.fna/Single_line
module load Bio/BLAST+/2.15.0

for file in [AS]*;
do blastx -query $file -db ~/Ostei/prot.faa/genes/MUC/MUC5/MUC5.fasta -outfmt 6 -evalue 1e-15 -out $file,muc5.out;
done
