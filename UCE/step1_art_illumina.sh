#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=65gb
#SBATCH --job-name=art_illumina
#SBATCH --error=artillumina.err
#SBATCH --output=artillumina.out
#SBATCH --partition=short

cd ~/UCE/Ostei/genome_base/;
for file in Actino_Tele_*.fasta Sarco_*.fasta Chondry_*.fasta;
do ./../../../programas/art_bin_MountRainier/art_illumina --paired --in $file \
    --out ~/UCE/Ostei/probset_design/${file%.fasta}-pe120-reads \
    --len 100 --fcov 2 --mflen 200 --sdev 130 -ir 0.0 -ir2 0.0 -dr 0.0 -dr2 0.0 -qs 100 -qs2 100 -na ;
done
