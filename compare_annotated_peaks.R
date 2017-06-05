##Examine annotated peaks

setwd("C:/Users/Katherine Holsteen/Documents/My Documents/Coursework/S17_GENE245/project/Data5")
#1.  In excel:  abbreviated promoter name to first 5 chars --> Anno.Abbrev
aa <- read.table("ATAC-RC_Rep1_window.annotatedPeaks_Abbrev.txt",  quote=NULL, nrows=3262,
                 header=TRUE, sep = "\t", stringsAsFactors=FALSE)
ad <- read.table("Duke_DNase_window.annotatedPeaks_Abbrev.txt",  quote=NULL, nrows=124322,   
                 header=TRUE, sep = "\t")

#The distribution of labels is quite different between the two methods
#However, this may be an artifact of the different sequencing depths
prop.table(table(aa$Anno.Abbrev))
prop.table(table(ad$Anno.Abbrev))
Distance <- list(aa$Distance.to.TSS, ad$Distance.to.TSS)
names(Distance) <- c("ATAC", "DNase")

#The distances are very spread out --> take middle 98%
summary(Distance[[1]])
summary(Distance[[2]])
DistTrimmed <- lapply(Distance, function(t) {
  return(t[t > quantile(t,probs=0.01) & t < quantile(t,probs = 0.99)])
})
#The ATAC peaks are much more centralized within a very small distance from
#a TSS while the DNAse are more spread out, perhaps due to dif. sequencing depth
pdf(file="TSS_Distance.pdf")
  par(mfrow=c(2,1))
  plot(density(DistTrimmed[[1]]), col=1, 
       main = "ATAC", xlim=range(-2e+05,3e+05))
  plot(density(DistTrimmed[[2]]), type = "l", col=2, 
       main = "DNAse", xlim=range(-2e+05,3e+05))
dev.off()

#Check window width --> as expected
summary(aa$End-aa$Start)
summary(ad$End-ad$Start)
