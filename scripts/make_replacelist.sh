#!/bin/sh

mkdir -p data/replacelist && cd $_

wget ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/assembly_summary.txt

cat assembly_summary.txt | awk -F "\t" -v 'OFS=' '{print $1,"_",$16,"_genomic","\t",$8}' | cut -d " " -f 1,2 | sed -e 's/ /_/g'> X
cat assembly_summary.txt | awk -F "\t" -v 'OFS=' '{print $9}' | sed -e 's/strain=//g' | sed -e 's/ /_/g' > Y
paste -d "_" X Y > replacelist1.txt

cat assembly_summary.txt | awk -F "\t" -v 'OFS=' '{print $1,"_",$16,"_genomic.gbff","\t",$8}' | cut -d " " -f 1,2 | sed -e 's/ /_/g'> X
cat assembly_summary.txt | awk -F "\t" -v 'OFS=' '{print $9}' | sed -e 's/strain=//g' | sed -e 's/ /_/g' > Y
paste -d "_" X Y > replacelist2.txt

cat assembly_summary.txt | awk -F "\t" -v 'OFS=' '{print $1,"_",$16,"_genomic.gbff.fna","\t",$8}' | cut -d " " -f 1,2 | sed -e 's/ /_/g'> X
cat assembly_summary.txt | awk -F "\t" -v 'OFS=' '{print $9}' | sed -e 's/strain=//g' | sed -e 's/ /_/g' > Y
paste -d "_" X Y > replacelist3.txt

cat assembly_summary.txt | awk -F "\t" -v 'OFS=' '{print $1,"_",$16,"_genomic.gbff.faa","\t",$8}' | cut -d " " -f 1,2 | sed -e 's/ /_/g'> X
cat assembly_summary.txt | awk -F "\t" -v 'OFS=' '{print $9}' | sed -e 's/strain=//g' | sed -e 's/ /_/g' > Y
paste -d "_" X Y > replacelist4.txt
