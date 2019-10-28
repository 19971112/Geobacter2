# Geobacter project

last-update 2019-10-28

-------------------------------------------------
## Table of contents

- 解析に使用するデータセット
- 系統解析
  - コアゲノムに基づいた系統解析
  - 16s RNAに基づいた系統解析
- 参考文献

-------------------------------------------------

## 解析に使用するデータセット

refseqデータベースの代表配列のうち，Complete Genomeのゲノム

`$ cat assembly_summary_refseq.txt | awk -F "\t" '$5 ~ /reference|representative/ && $8 ~ /'"$organism_name"'/ && $11=="latest" && $12 ~ /Complete Genome/ {print $0}' | cut -f8,10`

```
Geobacter sulfurreducens PCA	
Geobacter metallireducens GS-15	
Geobacter uraniireducens Rf4	
Geobacter lovleyi SZ	
Geobacter bemidjiensis Bem	
Geobacter daltonii FRC-32	
Geobacter pickeringii	
```
