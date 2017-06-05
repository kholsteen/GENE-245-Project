#Plot ROC curves for different kernel types
#install.packages('pROC')
library(pROC)
#setwd("C:/Users/Katherine Holsteen/Documents/My Documents/Coursework/S17_GENE245/project/Data4")
setwd("/afs/.ir.stanford.edu/users/k/k/kkroeger/GENE245/Data5")

pdf(file="SVM_ROCs.pdf") 
rc = lapply(0:5, function(k) {
  testA <- read.table(paste0("PredA_", k))
  testD <- read.table(paste0("PredD_", k))
  return(roc(controls = testA$V2, cases = testD$V2))
})
par(mfrow=c(1,1))
plot(rc[[1]])
for (k in 1:5) {
  lines(rc[[k+1]], col=k+1)
}
kernels = c("Gapped K-mer", "L-mer w/ full filter", "GKM", "GKM + RBF", "WGKM", "WGKM + RBF")
aucs = round(sapply(rc, function(roc) {return(roc$auc)}),2)
legend("bottomright", legend = paste(kernels, ",", aucs), col=c(1:6), lty=1)
dev.off()
