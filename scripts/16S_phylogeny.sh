#PBS -q small
#PBS -l ncpus=1
#PBS -V
cd ${PBS_O_WORKDIR}
source activate bio

# extracting 16S rRNA sequence from GenBank files and concatenate
mkdir -p data/16S_3
for i in data/dataset/*.gbff; do python scripts/ex_16SrRNA2.py $i > $i.16S.fasta; mv $i.16S.fasta data/16S_3; done
cat data/16S_3/*.16S.fasta > data/16S_3/all.fasta

# Multiple alignment
mkdir -p analysis/16S_phylogeny_3
mafft --auto data/16S_3/all.fasta > analysis/16S_phylogeny_3/16S.maf

# phylogeny
FastTree -gtr -nt analysis/16S_phylogeny_3/16S.maf > analysis/16S_phylogeny_3/16S.maf.newick
