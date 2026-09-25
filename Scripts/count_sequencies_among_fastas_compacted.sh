#!/bin/bash

echo "Sarco:" $(grep -ch ">" Ortho_*_Sarco_*.fasta | sort -nu | awk 'NR==1{min=$1} END{print min, $1}')
echo "Actino:" $(grep -ch ">" Ortho_*_Actino_*.fasta | sort -nu | awk 'NR==1{min=$1} END{print min, $1}')
