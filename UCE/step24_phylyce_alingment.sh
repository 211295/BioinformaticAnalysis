#!/bin/bash

cd ~/UCE/actino/2genomes-of-all-species/taxon-sets
phyluce_align_seqcap_align --fasta all-taxa-incomplete.fasta --output mafft-fasta-internal-trimmed
	--taxa 109 #number of taxons
	--aligner mafft # mafft is the default, options mafft or muscle
	--cores 12
	--incomplete-matrix
	--output-format fasta # default NEXUS
	--no-trim --log-path all/
## if should be trim
phyluce_align_get_gblocks_trimmed_alignments_from_untrimmed
	--alignments mafft-fasta-internal-trimmed
	--output mafft-nexus-internal-trimmed-gblocks
	--cores 12
	--log all/

cd ~/UCE/sarco/2genomes-of-all-species/taxon-sets
phyluce_align_seqcap_align --fasta all-taxa-incomplete.fasta --output mafft-fasta-internal-trimmed
        --taxa 84 #number of taxons
        --aligner mafft # mafft is the default, options mafft or muscle
        --cores 12
        --incomplete-matrix
        --output-format fasta # default NEXUS
        --no-trim --log-path all/
## if should be trim
phyluce_align_get_gblocks_trimmed_alignments_from_untrimmed
        --alignments mafft-fasta-internal-trimmed
        --output mafft-nexus-internal-trimmed-gblocks
        --cores 12
        --log all/
