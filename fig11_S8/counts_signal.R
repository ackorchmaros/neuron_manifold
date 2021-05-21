#----------------------- Normalized counts of neuronal signal for each neurons
## author: Annachiara Korchmaros
## comments: 
# (1) load 1 repeat from MICE dataset (fully or 1st step preprocessed)
# (2) normalize the signal 
# (3) choose bins extrema st the minimum count across neurons is 40 (optional only to tune the parameter)
# (4) save the counts to be used in python
#############
## libraries 
##############
library(base)
library(ggplot2)  
library(data.table)
library(R.matlab) 
library(BBmisc) # normalize function
library(MASS)
##############
## arguments 
##############
args = commandArgs(trailingOnly=TRUE)
mouse<-args[1] 
type.data<-args[2] 
in.dir<-args[3] 
# output path
out.dir<-args[4] 
dir.create(out.dir, showWarnings = FALSE)
###############
## steps
###############
#(1)
f.data.all<-paste0(in.dir,"/",type.data,"_",mouse,".mat")
data.all <- readMat(f.data.all)  
if (type.data=="clean_signal"){
  data.stim<-data.all$signal # dimension 2800 8122
  data.stim.repeat<-data.stim[,,1] # grab 1st repeat
}else{
  data.stim<-data.all$stim[2]
  data.stim<-data.frame(data.stim)
  data.stim.repeat<-data.stim[1:(dim(data.stim)[1]/2),]
  data.stim.repeat<-as.matrix(data.stim.repeat)
}

#(2)
norm.data.stim.repeat<-normalize(data.stim.repeat, method = "standardize", range = c(0, 1), margin = 2L, on.constant = "quiet")

#(3)
# min.data<-min(apply(norm.data.stim.repeat,2,min))
# max.data<-max(apply(norm.data.stim.repeat,2,max))
n.breaks<-800
# vect.n.nonzero.counts<-lapply(1:dim(norm.data.stim.repeat)[2], function(neuron){
#   size<-(max.data-min.data)/n.breaks
#   breaks.intervals<-seq(min.data,max.data,size)
#   hist.counts<-hist(norm.data.stim.repeat[,neuron],breaks=breaks.intervals,plot = F)$counts
#   n.nonzero.counts<-length(which(hist.counts!=0))
#   return(n.nonzero.counts)
# })
# vect.n.nonzero.counts<-unlist(vect.n.nonzero.counts)
# min(vect.n.nonzero.counts)

#(4)
min.data<-min(apply(norm.data.stim.repeat,2,min))
max.data<-max(apply(norm.data.stim.repeat,2,max))
size<-(max.data-min.data)/n.breaks
breaks.intervals<-seq(min.data,max.data,size)
matrix.counts<-apply(norm.data.stim.repeat,2, function(neuron){
  hist.counts<-hist(neuron,breaks=breaks.intervals,plot = F)$counts
  return(hist.counts)
})
write.csv2(t(matrix.counts),paste0(out.dir,"/matrix_counts_",type.data,"_",mouse,".csv"),row.names = F)