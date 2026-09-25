#!/bin/bash

# For Ortho_*_Sarco_*.fasta files
echo "Sarcopterygii files:"
grep -ch ">" Ortho_*_Sarco_*.fasta | sort -nu | {
    read -r first
    read -r last
    while read -r line; do last="$line"; done
    echo "Min: $first, Max: $last"
}

# For Ortho_*_Actino_*.fasta files
echo "Actinopterygii files:"
grep -ch ">" Ortho_*_Actino_*.fasta | sort -nu | {
    read -r first
    read -r last
    while read -r line; do last="$line"; done
    echo "Min: $first, Max: $last"
}
