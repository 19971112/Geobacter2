#!/bin/sh

mkdir -p analysis/Genome_signature/gbk && cd $_

# copy GenBank files and change extension
cp ../../../data/dataset2/*.gbff .
cd ..

for FILE in `ls -Sr gbk/*.gbff`; do echo -n $FILE" "; qsub -v gbk="$FILE" pbs.sh; done > log.$(date +%F).txt
