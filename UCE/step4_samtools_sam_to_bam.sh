#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=20gb
#SBATCH --job-name=samtools
#SBATCH --error=samtobam.err
#SBATCH --output=samtobam.out
#SBATCH --partition=short

export MAMBA_ROOT_PREFIX=/opt/Micromamba/
eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
micromamba activate samtools

cd ~/UCE/Ostei/alinhamentos/
for file in *.sam;
do samtools view -bS $file > ${file%.sam}.bam;
gzip $file
done
