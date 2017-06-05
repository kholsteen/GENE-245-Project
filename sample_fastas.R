
#setwd("C:/Users/Katherine Holsteen/Documents/My Documents/Coursework/S17_GENE245/project/Data3")
setwd("/afs/.ir.stanford.edu/users/k/k/kkroeger/GENE245/Data5")

source("http://bioconductor.org/biocLite.R")
library('seqinr')

faFull <- read.fasta("ATAC-RC_Rep1_summits_bedalignment.window.fasta")
fdFull <- read.fasta("Duke_DNase_bedalignment.window.fasta")
set.seed(568393)
nTrain = 2400
nTest = 600

faTrainList = sample(x=c(1:length(faFull)), size=nTrain, replace=FALSE)
faTestList = sample(x=c(1:(length(faFull)-nTrain)),size = nTest, replace = FALSE)
fdTrainList = sample(x=c(1:length(fdFull)), size=nTrain, replace=FALSE)
fdTestList = sample(x=c(1:(length(fdFull)-nTrain)),size = nTest, replace = FALSE)


TrainA <-faFull[faTrainList] 
write.fasta(sequences = TrainA, names = names(TrainA), file.out = "TrainA.fasta")

TestA <- faFull[-faTrainList][faTestList]
write.fasta(sequences = TestA, names = names(TestA), file.out = "TestA.fasta")

TrainD <- fdFull[faTrainList]
write.fasta(sequences = TrainD, names = names(TrainD), file.out = "TrainD.fasta")

TestD <- fdFull[-fdTrainList][fdTestList]
write.fasta(sequences = TestD, names = names(TestD), file.out = "TestD.fasta")










