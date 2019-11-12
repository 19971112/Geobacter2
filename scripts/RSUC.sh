#!/bin/sh
#PBS -q small
#PBS -l ncpus=1
#PBS -V

mkdir -p analysis/RSCU && cd $_

python ../../scripts/list.py "../../data/dataset3/*.gbff" > list.txt
for i in $(cut -f1 list.txt); do Rscript ../../scripts/RSCU.R; done


