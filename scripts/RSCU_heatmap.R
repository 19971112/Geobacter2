# install.packages("gplots")

args1 = commandArgs(trailingOnly=TRUE)[1]


library(gplots)
args1 = "heatmap.csv"
d <- read.table(args1, sep=",", header=TRUE)
d2 <- d[, 3:]
