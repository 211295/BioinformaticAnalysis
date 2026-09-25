#!/bin/sh
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=35
#SBATCH --time=100:00:00
#SBATCH --mem=80gb
#SBATCH --job-name=BRAKER2teste
#SBATCH --error=braker_teste.err
#SBATCH --output=braker_teste.out
#SBATCH --partition=bigmem

. /home/fssalles/miniconda3/etc/profile.d/conda.sh
conda activate BRAKER-2.1.6

cd /home/fssalles/braker_Felipe
braker.pl --species=Acipenseriforme_transmontanus --genome=Acipenseri_teste_braker.fasta --cores=45 --prot_seq=/home/fssalles/Ostei/prot.faa/uniprot_sprot.fasta --GENEMARK_PATH=/home/fssalles/miniconda3/envs/BRAKER-2.1.6/gmes_linux_64_4/ --PROTHINT_PATH=/home/fssalles/miniconda3/envs/BRAKER-2.1.6/ProtHint-2.6.0/bin --softmasking --gff3
