#!/bin/sh

mkdir -p analysis/Genome_signature2/gbk && cd $_

# copy GenBank files and change extension
cp ../../../data/dataset3/*.gbff .
cd ..

for FILE in `ls -Sr gbk/*.gbff`; do echo -n $FILE" "; qsub -v gbk="$FILE" ../../scripts/run_g_genome.sh; done > log.$(date +%F).txt
