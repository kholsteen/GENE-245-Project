source("https://bioconductor.org/biocLite.R")
biocLite("Sushi")
library('Sushi')
bg <- read.table("ATAC_Rep2.norm.bedGraph")
head(bg)
table(bg$V1)
chrom = "chr1"
chromstart = 564501
chromend = 249200000
plotBedgraph(bg,chrom,chromstart,chromend,colorbycol= SushiColors(5))
