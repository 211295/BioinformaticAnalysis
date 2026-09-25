#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=30
#SBATCH --time=100:00:00
#SBATCH --mem=100gb
#SBATCH --job-name=ORTHOFINDERAM5
#SBATCH --error=orthofinder_actinoMuc5.err
#SBATCH --output=orthofinder_actinoMuc5.out
#SBATCH --partition=long



### Using the tutorial (https://davidemms.github.io/orthofinder_tutorials/downloading-and-running-orthofinder.html)
### check the help options
### ./orthofinder -h

cd ~/MandM/OrthoFinder/
./orthofinder -d -a 30 -S blast -I 1.4 -X My_data/Actino_Muc5/

# -d Input is DNA sequences
# -a Number of parallel analysis threads
# -S Sequence search program (Options: blast, diamond, diamond_ultra_sens, blast_gz, mmseqs, blast_nucl)
# -I MCL inflation parameter [Default = 1.5]
# -X Don't add species names to sequence IDs
