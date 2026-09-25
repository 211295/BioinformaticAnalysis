#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=24:00:00
#SBATCH --mem=5gb
#SBATCH --job-name=merge
#SBATCH --error=merge.err
#SBATCH --output=merge.out
#SBATCH --partition=short

for critter in Actino_Acipen_A_ruthenus Actino_Neotele_Perco_S_scombrus Sarco_Mammals_O_anatinus Actino_Elopo_A_goreensis Actino_Poly_E_calabarius Sarco_Reptilia_Archo_A_platyrhynchos Actino_Elopo_M_atlanticus Actino_Tele_Osteoglo_B_brachyistius  Sarco_Reptilia_Archo_H_harpyja Actino_Eupercaria_A_latus Actino_Tele_Oto_A_sapidissima  Sarco_Reptilia_C_caretta Actino_Eupercaria_C_lumpus Actino_Tele_Oto_C_carpio  Sarco_Amphi_B_bufo Sarco_Reptilia_Croco_A_mississipiensis Actino_Eupercaria_P_pungitius Actino_Tele_Oto_D_rerio  Sarco_Amphi_H_boettgeri   Sarco_Reptilia_Lepdo_N_naja Actino_Eupercaria_S_aurata Actino_Tele_Oto_T_dalaica  Sarco_Amphi_R_bivittatum Sarco_Reptilia_Lepdo_T_elegans Actino_Holostei_A_spatula Actino_Tele_Prota_O_keta Sarco_Mammals_B_taurus Sarco_Reptilia_Passeri_L_discolor Actino_Neotele_G_macrocephalus  Actino_Tele_Prota_S_salar Sarco_Mammals_C_lupus Actino_Neotele_Perco_M_zebra Actino_Tele_Sto_H_transpacificus Sarco_Mammals_G_gorilla Actino_Neotele_Perco_P_eques Sarco_Mammals_L_africana;
do
cd ~/UCE/Ostei/probset_design;
echo "working on $critter";
touch ${critter}-pe120-reads.fq;
cat ${critter}-pe120-reads1.fq > ${critter}-pe120-reads.fq
cat ${critter}-pe120-reads2.fq >> ${critter}-pe120-reads.fq
rm ${critter}-pe120-reads[12].fq
# gzip ${critter}-pe120-reads.fq;
done

# Chondry_Batoidea_M_hypostoma Chondry_Batoidea_H_akajei Chondry_Holo_C_phantasma  Chondry_Selachii_C_amblyrhynchos Chondry_Selachii_C_maximus 
