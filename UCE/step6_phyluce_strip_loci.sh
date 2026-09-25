#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_strip
#SBATCH --error=phylucestrip.err
#SBATCH --output=phylucestrip.out
#SBATCH --partition=short

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate phyluce

cd ~/UCE/Ostei/alinhamentos/beds;
for file in *.merged;
do phyluce_probe_strip_masked_loci_from_set --bed $file --twobit ~/UCE/Ostei/Sarco_Dipnoi_N_forsteri/Sarco_Dipnoi_N_forsteri.2bit \
	--output ${file%.merged}.striped --filter-mask 0.15 --min-length 100 ; done

cd ~/UCE/Ostei/alinhamentos/beds;
for file in *.merged;
do phyluce_probe_strip_masked_loci_from_set --bed $file --twobit ~/UCE/Ostei/Sarco_Mammals_H_sapiens/Sarco_Mammals_H_sapiens.2bit \
        --output ${file%.merged}.1striped --filter-mask 0.15 --min-length 100 ; done

cd ~/UCE/Ostei/alinhamentos/beds;
for file in *.merged;
do phyluce_probe_strip_masked_loci_from_set --bed $file --twobit ~/UCE/Ostei/Actino_Holostei_A_spatula/Actino_Holostei_A_spatula.2bit \
        --output ${file%.merged}.2striped --filter-mask 0.15 --min-length 100 ; done

cd ~/UCE/Ostei/alinhamentos/beds;
for file in *.merged;
do phyluce_probe_strip_masked_loci_from_set --bed $file --twobit ~/UCE/Ostei/Actino_Elopo_G_javanicus/Actino_Elopo_G_javanicus.2bit \
        --output ${file%.merged}.3striped --filter-mask 0.15 --min-length 100 ; done

cd ~/UCE/Ostei/alinhamentos/beds;
for file in *.merged;
do phyluce_probe_strip_masked_loci_from_set --bed $file --twobit ~/UCE/Ostei/Actino_Poly_E_calabarius/Actino_Poly_E_calabarius.2bit \
        --output ${file%.merged}.4striped --filter-mask 0.15 --min-length 100 ; done

cd ~/UCE/Ostei/alinhamentos/beds;
for file in *.merged;
do phyluce_probe_strip_masked_loci_from_set --bed $file --twobit ~/UCE/Ostei/Chondry_Selachii_C_punctatum/Chondry_Selachii_C_punctatum.2bit \
        --output ${file%.merged}.5striped --filter-mask 0.15 --min-length 100 ; done
