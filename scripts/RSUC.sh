#!/bin/sh
#PBS -q small
#PBS -l ncpus=1
#PBS -V

mkdir -p analysis/RSCU 
python scripts/list.py "data/dataset3/*.gbff" > analysis/RSCU/list.txt
cd analysis/RSCU
for i in $(cut -f1 list.txt); do Rscript ../../scripts/RSCU.R; done


