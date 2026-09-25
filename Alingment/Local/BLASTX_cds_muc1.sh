#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --time=24:00:00
#SBATCH --mem=40gb
#SBATCH --job-name=BLASTX1
#SBATCH --error=blastx1.err
#SBATCH --output=blastx1.out
#SBATCH --partition=short

cd ~/Ostei/cds.fna/Single_line
module load Bio/BLAST+/2.15.0

for file in [AS]*;
do blastx -query $file -db ~/Ostei/prot.faa/genes/MUC/MUC1/MUC1_taxonomy_id_32523.fasta -outfmt 6 -evalue 1e-10 -out muc1/$file,muc1.out;
done
