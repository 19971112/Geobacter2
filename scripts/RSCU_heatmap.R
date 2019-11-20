# install.packages("gplots")
# source("http://bioconductor.org/biocLite.R")
# biocLite()
# biocLite("genefilter")
# biocLite("gplots")

# library(gplots)

args1 = commandArgs(trailingOnly=TRUE)[1]

# まとめ
args1 = "ch_rename2_heatmap.csv.tsv.sort.txt"
d <- read.table(args1, sep="\t", header=TRUE, row.names=1)
d <- as.matrix(d[,-c(65,66,67)])
par(family="Courier")
heatmap(d, Colv=NA, Rowv=NA, col=cm.colors(256), cexCol=0.5)


col1<-rgb(0.7, 0.5, 0.2, 0.7) #色は RGB alphaで0-1の値で指定できる。
col2<-rgb(0.2, 0.5, 0.7, 0.7)

my.col2 <- colorRampPalette(c(col1,"white",col2)) 
heatmap(x, col=my.col2(256))
