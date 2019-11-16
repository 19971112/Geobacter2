# Geobacter project

last-update 2019-10-29

-------------------------------------------------
## Command

```
# git clone と更新
git clone https://github.com/19971112/Geobacter.git
mv *.sh.* job/
mv *.job.* job/

git pull origin master

# 置換リストの作成
bash scripts/make_replacelist.sh

# データセットの用意
qsub scripts/DL_dataset_2019-11-04.sh
qsub scripts/DL_dataset_2019-11-08.sh

# 16S rRNAに基づく系統解析
qsub scripts/16S_phylogeny_2019-11-04.sh
qsub scripts/16S_phylogeny.sh
qsub scripts/16S_phylogeny2.sh

# RSUCの解析
qsub scripts/RSUC.sh

# ゲノムの特徴解析（総塩基数 Size、GC含量 GC、遺伝子数 tRNA rRNA cds highlyExpressed、コドン使用バイアス S_value delta_enc）
bash scripts/genome_signature.sh
bash scripts/genome_signature2.sh &

# 多変量解析
qsub scripts/WCA.job
qsub scripts/WCA2.job
qsub scripts/WCA3.job
qsub scripts/WCA4.job



```

---
## MEMO

```
$ cat assembly_summary_refseq.txt | sed -n 2p | tr "\t" "\n" | nl
     1	# assembly_accession
     2	bioproject
     3	biosample
     4	wgs_master
     5	refseq_category
     6	taxid
     7	species_taxid
     8	organism_name
     9	infraspecific_name
    10	isolate
    11	version_status
    12	assembly_level
    13	release_type
    14	genome_rep
    15	seq_rel_date
    16	asm_name
    17	submitter
    18	gbrs_paired_asm
    19	paired_asm_comp
    20	ftp_path
    21	excluded_from_refseq
    22	relation_to_type_material
```
