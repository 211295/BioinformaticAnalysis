#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=20
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=BLASTXA
#SBATCH --error=blastxa.err
#SBATCH --output=blastxa.out
#SBATCH --partition=short

cd ~/Ostei/cds.fna/Single_line
module load Bio/BLAST+/2.15.0

for file in [AS]*;
do blastx -query $file -db ~/Ostei/prot.faa/genes/SURF/SFTPA/sftpa_taxonomy_id_32523_.fasta -evalue 1e-15 -outfmt 6 -out sftpa/$file,sftpa.out;
done
