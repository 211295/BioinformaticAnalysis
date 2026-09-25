#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=24:00:00
#SBATCH --mem=72gb
#SBATCH --job-name=minimap2
#SBATCH --error=minimap2.err
#SBATCH --output=minimap2.out
#SBATCH --partition=long

micromamba activate samtools
cd ~/UCE/Ostei/
for FASTA in Sarco_Dipnoi_N_forsteri.fasta Sarco_Mammals_H_sapiens.fasta Actino_Holostei_A_spatula.fasta Actino_Elopo_G_javanicus.fasta Chondry_Selachii_C_punctatum.fasta;
do
	for critter in  Actino_Neotele_Perco_S_scombrus Chondry_Batoidea_M_hypostoma Sarco_Mammals_O_anatinus Actino_Elopo_A_goreensis Actino_Poly_E_calabarius  Chondry_Holo_C_phantasma  Sarco_Reptilia_Archo_A_platyrhynchos Actino_Elopo_M_atlanticus Actino_Tele_Osteoglo_B_brachyistius  Chondry_Selachii_C_amblyrhynchos  Sarco_Reptilia_Archo_H_harpyja Actino_Eupercaria_A_latus Actino_Tele_Oto_A_sapidissima Chondry_Selachii_C_maximus  Sarco_Reptilia_C_caretta Actino_Eupercaria_C_lumpus Actino_Tele_Oto_C_carpio Sarco_Amphi_B_bufo Sarco_Reptilia_Croco_A_mississipiensis Actino_Eupercaria_P_pungitius  Actino_Tele_Oto_D_rerio Sarco_Amphi_H_boettgeri Sarco_Reptilia_Lepdo_N_naja Actino_Eupercaria_S_aurata Actino_Tele_Oto_T_dalaica  Sarco_Amphi_R_bivittatum  Sarco_Reptilia_Lepdo_T_elegans Actino_Holostei_A_spatula Actino_Tele_Prota_O_keta Sarco_Mammals_B_taurus Sarco_Reptilia_Passeri_L_discolor Actino_Neotele_G_macrocephalus  Actino_Tele_Prota_S_salar            Sarco_Mammals_C_lupus Actino_Neotele_Perco_M_zebra    Actino_Tele_Sto_H_transpacificus     Sarco_Mammals_G_gorilla Actino_Neotele_Perco_P_eques    Chondry_Batoidea_H_akajei            Sarco_Mammals_L_africana;
	do
	cd ~/programas/minimap2/
	./minimap2 -ax sr ~/UCE/Ostei/new_genomes/${FASTA} ~/UCE/Ostei/probset_design/${critter}-pe100-reads.fq > ~/UCE/Ostei/alinhamentos/aligned_by_minimap2_${critter}-to-${FASTA%.fasta}.sam;
	gzip ~/UCE/Ostei/alinhamentos/aligned_by_minimap2_${critter}-to-${FASTA%.fasta}.sam;
	done;
done
