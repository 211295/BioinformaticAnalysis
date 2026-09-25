#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=30gb
#SBATCH --job-name=bedtools
#SBATCH --error=bedsortmerge.err
#SBATCH --output=bedsortmerge.out
#SBATCH --partition=short

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate bedtools

cd ~/UCE/Ostei/alinhamentos/
for file in Actino_Acipen_A_ruthenus Actino_Neotele_Perco_S_scombrus Chondry_Batoidea_M_hypostoma Sarco_Mammals_O_anatinus Actino_Elopo_A_goreensis Chondry_Holo_C_phantasma Sarco_Reptilia_Archo_A_platyrhynchos Actino_Elopo_M_atlanticus  Actino_Tele_Osteoglo_B_brachyistius Chondry_Selachii_C_amblyrhynchos Sarco_Reptilia_Archo_H_harpyja Actino_Eupercaria_A_latus Actino_Tele_Oto_A_sapidissima Chondry_Selachii_C_maximus Sarco_Reptilia_C_caretta Actino_Eupercaria_C_lumpus Actino_Tele_Oto_C_carpio Sarco_Amphi_B_bufo Sarco_Reptilia_Croco_A_mississipiensis Actino_Eupercaria_P_pungitius   Actino_Tele_Oto_D_rerio Sarco_Amphi_H_boettgeri Sarco_Reptilia_Lepdo_N_naja Actino_Eupercaria_S_aurata   Actino_Tele_Oto_T_dalaica  Sarco_Amphi_R_bivittatum Sarco_Reptilia_Lepdo_T_elegans Actino_Holostei_A_spatula Actino_Tele_Prota_O_keta  Sarco_Mammals_B_taurus  Sarco_Reptilia_Passeri_L_discolor Actino_Neotele_G_macrocephalus  Actino_Tele_Prota_S_salar Sarco_Mammals_C_lupus Actino_Neotele_Perco_M_zebra Actino_Tele_Sto_H_transpacificus Sarco_Mammals_G_gorilla Actino_Neotele_Perco_P_eques Chondry_Batoidea_H_akajei  Sarco_Mammals_L_africana;
#aligned_by_minimap2_${critter}-to-Poly.bam
do ~/programas/bedtools2/bin/bedtools bamtobed -i aligned_by_minimap2_${file}-to-Ecala.bam -bed12 > beds/aligned_by_minimap2_${file}-to-Ecala.bed;
~/programas/bedtools2/bin/bedtools sort -i beds/aligned_by_minimap2_${file}-to-Ecala.bed > beds/aligned_by_minimap2_${file}-to-Ecala.sorted;
~/programas/bedtools2/bin/bedtools merge -i beds/aligned_by_minimap2_${file}-to-Ecala.sorted > beds/aligned_by_minimap2_${file}-to-Ecala.merged;
wc -l beds/aligned_by_minimap2_${file}-to-Ecala.merged;
done

Actino_Elopo_A_goreensis,
Actino_Elopo_M_atlanticus,
Actino_Eupercaria_A_latus,
Actino_Eupercaria_C_lumpus,
Actino_Eupercaria_P_pungitius,
Actino_Eupercaria_S_aurata,
Actino_Holostei_A_spatula,
Actino_Neotele_G_macrocephalus,
Actino_Neotele_Perco_M_zebra,
Actino_Neotele_Perco_P_eques,
Actino_Neotele_Perco_S_scombrus,
Actino_Poly_E_calabarius,
Actino_Tele_Osteoglo_B_brachyistius,
Actino_Tele_Oto_A_sapidissima,
Actino_Tele_Oto_C_carpio,
Actino_Tele_Oto_D_rerio,
Actino_Tele_Oto_T_dalaica,
Actino_Tele_Prota_O_keta,
Actino_Tele_Prota_S_salar,
Actino_Tele_Sto_H_transpacificus,
Chondry_Batoidea_H_akajei,
Chondry_Batoidea_M_hypostoma,
Chondry_Holo_C_phantasma,
Chondry_Selachii_C_amblyrhynchos,
Chondry_Selachii_C_maximus,
Sarco_Amphi_B_bufo,
Sarco_Amphi_H_boettgeri,
Sarco_Amphi_R_bivittatum,
Sarco_Mammals_B_taurus,
Sarco_Mammals_C_lupus,
Sarco_Mammals_G_gorilla,
Sarco_Mammals_L_africana,
Sarco_Mammals_O_anatinus,
Sarco_Reptilia_Archo_A_platyrhynchos,
Sarco_Reptilia_Archo_H_harpyja,
Sarco_Reptilia_C_caretta,
Sarco_Reptilia_Croco_A_mississipiensis,
Sarco_Reptilia_Lepdo_N_naja,
Sarco_Reptilia_Lepdo_T_elegans,
Sarco_Reptilia_Passeri_L_discolor
