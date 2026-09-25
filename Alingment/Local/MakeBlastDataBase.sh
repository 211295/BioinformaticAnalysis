#!/bin/bash
### To use BLAST must create a database
### open BLAST with module, and after use the command 'makeblastdb'

module load Bio/BLAST+/2.15.0
cd ~/Ostei/prot.faa/genes/;
cd MUC/MUC1_Actino/;
makeblastdb -in *32443.fasta -dbtype 'prot';
cd ../MUC5_Actino/;
makeblastdb -in *32443.fasta -dbtype 'prot';
cd ../MUC1/
makeblastdb -in *id_32523.fasta -dbtype 'prot';
cd ../MUC5/
makeblastdb -in *id_32523.fasta -dbtype 'prot';
cd ../../SURF/SFTPA_Actino/;
makeblastdb -in *32443.fasta -dbtype 'prot';
cd ../SFTPD_Actino/;
makeblastdb -in *32443.fasta -dbtype 'prot';
cd ../SFTPA/
makeblastdb -in *id_32523.fasta -dbtype 'prot';
cd ../SFTPD/
makeblastdb -in *id_32523.fasta -dbtype 'prot';
