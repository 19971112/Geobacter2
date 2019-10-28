# Geobacter project

last-update 2019-10-28

-------------------------------------------------
## Table of contents

- [解析に使用するデータセット](#解析に使用するデータセット候補)
- 系統解析
  - 外群候補
  - コアゲノムに基づいた系統解析
  - 16s RNAに基づいた系統解析
- 参考文献

-------------------------------------------------

## 解析に使用するデータセット候補

- refseqデータベースに登録されているGeobacter属細菌
```
$ cat assembly_summary_refseq.txt | awk -F "\t" '$8 ~ /'"$organism_name"'/ && $11=="latest" {print $0}' | cut -f8,10,12

Geobacter sulfurreducens PCA		Complete Genome
Geobacter metallireducens GS-15		Complete Genome
Geobacter uraniireducens Rf4		Complete Genome
Geobacter lovleyi SZ		Complete Genome
Geobacter bemidjiensis Bem		Complete Genome
Geobacter daltonii FRC-32		Complete Genome
Geobacter sp. M21		Complete Genome
Geobacter sp. M18		Complete Genome
Geobacter sulfurreducens KN400		Complete Genome
Geobacter metallireducens RCH3		Contig
Geobacter bremensis R1		Scaffold
Geobacter sp. OR-1		Contig
Geobacter soli		Scaffold
Geobacter pickeringii		Complete Genome
Geobacter sulfurreducens		Chromosome
Geobacter anodireducens		Complete Genome
Geobacter pelophilus		Scaffold
Geobacter sp. DSM 2909		Scaffold
Geobacter sulfurreducens		Complete Genome
Geobacter argillaceus		Scaffold
Geobacter sp. FeAm09		Complete Genome
Geobacter sp. Red88		Contig
Geobacter sp. Red100		Scaffold
Geobacter sp. Red96		Scaffold
Geobacter thiogenes		Scaffold
Geobacter sp. DSM 9736		Chromosome
```

- refseqデータベースに登録されているGeobacter属細菌の中で，Complete Genomete又はChromosomeの配列
```
$ cat assembly_summary_refseq.txt | awk -F "\t" '$8 ~ /'"$organism_name"'/ && $11=="latest" && $12 ~ /Complete Genome|Chromosome/ {print $0}' | cut -f8,10,12

Geobacter sulfurreducens PCA		Complete Genome
Geobacter metallireducens GS-15		Complete Genome
Geobacter uraniireducens Rf4		Complete Genome
Geobacter lovleyi SZ		Complete Genome
Geobacter bemidjiensis Bem		Complete Genome
Geobacter daltonii FRC-32		Complete Genome
Geobacter sp. M21		Complete Genome
Geobacter sp. M18		Complete Genome
Geobacter sulfurreducens KN400		Complete Genome
Geobacter pickeringii		Complete Genome
Geobacter sulfurreducens		Chromosome
Geobacter anodireducens		Complete Genome
Geobacter sulfurreducens		Complete Genome
Geobacter sp. FeAm09		Complete Genome
Geobacter sp. DSM 9736		Chromosome
```

- refseqデータベースに登録されているGeobacter属細菌の中で，Complete Genometeの配列
```
$ cat assembly_summary_refseq.txt | awk -F "\t" '$8 ~ /'"$organism_name"'/ && $11=="latest" && $12 ~ /Complete Genome/ {print $0}' | cut -f8,10,12

Geobacter sulfurreducens PCA		Complete Genome
Geobacter metallireducens GS-15		Complete Genome
Geobacter uraniireducens Rf4		Complete Genome
Geobacter lovleyi SZ		Complete Genome
Geobacter bemidjiensis Bem		Complete Genome
Geobacter daltonii FRC-32		Complete Genome
Geobacter sp. M21		Complete Genome
Geobacter sp. M18		Complete Genome
Geobacter sulfurreducens KN400		Complete Genome
Geobacter pickeringii		Complete Genome
Geobacter anodireducens		Complete Genome
Geobacter sulfurreducens		Complete Genome
Geobacter sp. FeAm09		Complete Genome
```

- refseqデータベースに登録されているGeobacter属細菌の中で，代表配列かつComplete Genomeの配列

```
$ cat assembly_summary_refseq.txt | awk -F "\t" '$5 ~ /reference|representative/ && $8 ~ /'"$organism_name"'/ && $11=="latest" && $12 ~ /Complete Genome/ {print $0}' | cut -f8,10

Geobacter sulfurreducens PCA	
Geobacter metallireducens GS-15	
Geobacter uraniireducens Rf4	
Geobacter lovleyi SZ	
Geobacter bemidjiensis Bem	
Geobacter daltonii FRC-32	
Geobacter pickeringii	
```

-------------------------------------------------

## 系統解析

### 外群の候補

系統解析に用いる外群の候補．  
コアゲノムに基づく系統解析の場合は，より多くのコアゲノムを得るために，近縁の株を外群として用いる．

- 候補1
Genome-based Geobacter phylogeny. Bayesian inference of the phylogenetic tree of the six Geobacter species discussed, using another Geobacteraceae species, Pelobacter propionicus, as the outgroup. The tree was based on a concatenation of the proteins in the 697 families that had exactly one ortholog conserved in each of the seven genomes (listed in Additional file 4 of the supplementary material). Values at branch points are posterior probabilities.  
https://www.researchgate.net/figure/Genome-based-Geobacter-phylogeny-Bayesian-inference-of-the-phylogenetic-tree-of-the-six_fig1_41038562
![画像](https://www.researchgate.net/publication/41038562/figure/fig1/AS:213951632678912@1428021452070/Genome-based-Geobacter-phylogeny-Bayesian-inference-of-the-phylogenetic-tree-of-the-six.png)  


-------------------------------------------------

## コドン使用解析
-------------------------------------------------

## 参考文献

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
