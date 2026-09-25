#!/bin/bash

# stack columns vertically in reverse order (last column first), you could:
# First find the loggest line, second Print Collumn in reverse order
# Pros -> More control over column order | Cons -> Slower for large files

for file in OrthoMCL_*.txt;
do
	max_cols=$(awk '{if (NF > max) max = NF} END{print max}' $file)
	for ((col=max_cols; col>=1; col--)); 
	do awk -v col="$col" '{if (NF >= col) print $col}' $file
	done > bonus_Method_$file;
done
