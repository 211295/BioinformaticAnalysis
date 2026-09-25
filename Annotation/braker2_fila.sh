#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --time=200:00:00
#SBATCH --mem=150gb
#SBATCH --job-name=braker2
#SBATCH --error=braker2.err
#SBATCH --output=braker2.out
#SBATCH --partition=bigmem

. /opt/conda/etc/profile.d/conda.sh
conda activate BRAKER-2.1.6

cd ~/Ostei/braker/

for file in Actino_Holostei_* Sarco_Dipnoi_* Actino_Poly_* ;
do braker.pl --genome=$file --prot_seq=~/Ostei/prot.faa/uniprot_sprot.fasta \
        --rnaseq_sets_ids=SRA_$file \
        --rnaseq_sets_dirs=~/Ostei/braker/RNA-Seq/
