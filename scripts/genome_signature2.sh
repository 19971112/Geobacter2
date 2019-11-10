#!/bin/sh

mkdir -p analysis/Genome_signature2/gbk && cd $_

# copy GenBank files and change extension
cp ../../../data/dataset3/*.gbff .
for filename in *.gbff; do mv $filename ${filename%.gbff}.gbk; done
cd ..

for FILE in `ls -Sr gbk/*.gbk`; do echo -n $FILE" "; qsub -v gbk="$FILE" ../../scripts/run_g_genome.sh; done > log.$(date +%F).txt

