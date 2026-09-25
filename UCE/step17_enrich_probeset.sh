#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=24:00:00
#SBATCH --mem=32gb
#SBATCH --job-name=phyluce_enrich_probes
#SBATCH --error=phyluceenrich.err
#SBATCH --output=phyluceenrich.out
#SBATCH --partition=short

#export MAMBA_ROOT_PREFIX=/opt/Micromamba/
#eval "$(/opt/bin/Micromamba/1.5.8-0/bin/micromamba shell hook -s posix)"
#micromamba activate phyluce

cd ~/UCE/
phyluce_probe_get_tiled_probe_from_multiple_inputs --fastas actino/genome-actino-lastz/genome-actino-fasta/
	--multi-fasta-output actino/Actino21-back-to-3.conf
	--probe-prefix "uce-actino" --designer fssalles --design actinopterygii-v1
	--tiling-density 10 --overlap middle --masking 0.25 --remove-gc --two-probes
	--output actino/genome-actino-lastz/genome-actino-fasta/actinopterygii-v1-master-probe-list.fasta
phyluce_probe_easy_lastz
	--target actino/genome-actino-lastz/genome-actino-fasta/actinopterygii-v1-master-probe-list.fasta
	--query actino/genome-actino-lastz/genome-actino-fasta/actinopterygii-v1-master-probe-list.fasta
	--identity 50
	--coverage 60
	--output actino/genome-actino-lastz/genome-actino-fasta/actinopterygii-v1-master-probe-list-TO-SELF-PROBES.lastz

phyluce_probe_get_tiled_probe_from_multiple_inputs --fastas sarco/genome-sarco.lastz/genome-sarco-fasta/
	--multi-fasta-output sarco/Sarco16-back-to-14.conf
	--probe-prefix "uce-sarco" --designer fssalles --design sarcopterygii-v1
	--tiling-density 5 --overlap middle --masking 0.25 --remove-gc --two-probes
	--output sarco/genome-sarco.lastz/genome-sarco-fasta/sarcopterygii-v1-master-probe-list.fasta
phyluce_probe_easy_lastz
        --target sarco/genome-sarco.lastz/genome-sarco-fasta/sarcopterygii-v1-master-probe-list.fasta
        --query sarco/genome-sarco.lastz/genome-sarco-fasta/sarcopterygii-v1-master-probe-list.fasta
        --identity 50
        --coverage 60
        --output sarco/genome-sarco.lastz/genome-sarco-fasta/sarcopterygii-v1-master-probe-list-TO-SELF-PROBES.lastz
