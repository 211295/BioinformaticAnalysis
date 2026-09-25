#!/bin/bash
### Use that script to compare the number of sequences I have in each specie files before and after trimmed by trimAl
### Divided in 3 parts, in order words (i.e.) its a combination of 3 scripts
### Before use that  scritp the file should be : 1) Separated by species
###                                              2) Aligned each sequencies per specie (to see how similar is the sequencies in each specie)
###                                              3) Trasnforme in a single line fasta aligned

cd ~/MandM/trimAl/trimal-1.5.0
for file in ali*Muc5*.fasta;
do source/trimal -in $file -out best_$file -resoverlap 0.50 -seqoverlap 80 -noallgaps;
done

### Trasnform the fasta file in a single line fasta file
for file2 in best_ali*Muc5*.fasta;
do
    awk '
    /^>/ {
        # Print newline before headers (except first header)
        if (NR > 1) { printf "\n" }
        print $0  # Print the header
        next
    }
    {
        printf "%s", $0  # Print sequence without newlines
    }
    END { printf "\n" }  # Final newline
    ' "$file2" > "new_$file2"
done

### start count the number of sequencies
grep -c ">" new_best_ali*Muc5*.fasta > abc ; # how many sequencies have in the trimmed file
wc -l new_best_ali*Muc5*.fasta > def ;
grep -c ">" ali*Muc5*.fasta > ghi;
paste abc def ghi > jkl;
sed 's/aligned_by_MAFFT_Ortho_Muc5_/:/g' jkl | awk -F ":" '{print $2 '\t' $3 '\t'$6}' > mno
sed 's/new_best_/\t/' | sed 's/.fasta/.fasta\t/' mno > pqr
awk -F'\t' '{sum+=$2} END {print sum}' pqr
awk -F'\t' '{sum+=$4} END {print sum}' pqr
