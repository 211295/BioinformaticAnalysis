#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_extract_loci
#SBATCH --error=phylucecreatenewfasta.err
#SBATCH --output=phylucecreatenewfasta.out
#SBATCH --partition=short

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate phyluce

### should rename the fasta files to match the real name of older files.
#rename 's/actino/Actino/' actino_*.fasta | rename 's/eupercaria/Eupercaria/' | rename 's/holostei/Holostei/' | rename 's/neotele/Neotele/' | rename 's/perco/Perco/' | rename 's/_tele_/_Tele_/' | rename 's/_oto_/_Oto_/' | rename 's/prota/Prota/' | rename 's/_sto_/_Sto_/' | rename 's/_poly_/_Poly_/' | rename 's/elopo/Elopo/' | rename 's/acipen/Acipen/' | rename 's/osteoglo/Osteoglo/' ;
#rename 's/_a_/_A_/' Actino_*.fasta ; rename 's/_o_/_O_/' Actino_*.fasta ; rename 's/_x_/_X_/' Actino_*.fasta ; rename 's/_g_/_G_/' Actino_*.fasta ; rename 's/_e_/_E_/' ; Actino_*.fasta ; rename 's/_m_/_M_/' Actino_*.fasta ; rename 's/_s_/_S_/' Actino_*.fasta ; rename 's/_p_/_P_/' Actino_*.fasta ; rename 's/_h_/_H_/' Actino_*.fasta ; rename 's/_l_/_L_/' Actino_*.fasta ; rename 's/_c_/_C_/' Actino_*.fasta ; rename 's/_d_/_D_/' Actino_*.fasta ; rename 's/_t_/_T_/' Actino_*.fasta ; rename 's/_b_/_B_/' Actino_*.fasta / rename 's/_f_/_F_/' Actino_*.fasta ; rename 's/_n_/_N_/' Actino_*.fasta ; rename 's/_k_/_K_/' Actino_*.fasta
cd ~/UCE
phyluce_assembly_get_fastas_from_match_counts --contigs actino/2genomes-of-all-species/uce-search-fastas/
	--locus-db actino/2genomes-of-all-species/uce-search-fastas/filtred/probe.mathces.sqlite
	--match-count-output actino/2genomes-of-all-species/taxon-sets/all-taxa-incomplete.fasta
	--incomplete-matrix actino/2genomes-of-all-species/taxon-sets/all-taxa-incomplete.incomplete
	--log-path actino/2genomes-of-all-species/taxon-sets/all/log
#should rename the fasta files to match the real name of older files
# rename 's/coelacanth/Coelacanth/' sarco_* ; rename 's/dipnoi/Dipnoi/' sarco_* ; rename 's/mammals/Mammals/' sarco_* ; rename 's/archo/Archo/' sarco_* ; rename 's/croco/Croco/' sarco_* ; rename 's/lepdo/Lepdo/' sarco_* ; rename 's/passeri/Passeri/' sarco_* ;  rename 's/reptilia/Reptilia/' sarco_* ; rename 's/sarco/Sarco/' sarco*
# rename 's/_a_/_A_/' *.fasta ; rename 's/_o_/_O_/' *.fasta ; rename 's/_x_/_X_/' *.fasta ; rename 's/_g_/_G_/' *.fasta ; rename 's/_e_/_E_/' *.fasta ; rename 's/_m_/_M_/' *.fasta ; rename 's/_s_/_S_/' *.fasta ; rename 's/_p_/_P_/' *.fasta ; rename 's/_h_/_H_/' *.fasta ; rename 's/_l_/_L_/' *.fasta ; rename 's/_c_/_C_/' *.fasta ; rename 's/_d_/_D_/' *.fasta ; rename 's/_t_/_T_/' *.fasta ; rename 's/_b_/_B_/' *.fasta ; rename 's/_f_/_F_/' *.fasta ; rename 's/_n_/_N_/' *.fasta ; rename 's/_z_/_Z_/' *.fasta ; rename 's/_r_/_R_/' *.fasta ; rename 's/_v_/_V_/' *.fasta
cd ~/UCE
phyluce_assembly_get_fastas_from_match_counts --contigs sarco/2genomes-of-all-species/uce-search-results/
	--locus-db sarco/2genomes-of-all-species/uce-search-results/filtred/probe.matches.sqlite
	--match-count-output sarco/2genomes-of-all-species/taxon-sets/all-taxa-incomplete.conf
	--incomplete-matrix sarco/2genomes-of-all-species/taxon-sets/all-taxa-incomplete.incomplete
	--log-path sarco/2genomes-of-all-species/taxon-sets/all/
	--output sarco/2genomes-of-all-species/taxon-sets/all/all-taxa-incomplete.fasta
