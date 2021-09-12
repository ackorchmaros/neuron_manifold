#--------------------------------------Sampling from a bimodal distribution
## author: Annachiara Korchmaros
## comments: 
#(1) sample N multivariate normal distribution with dimension M
#(2) save in NxM matrix for each cluster
#repeat 1-2 for both clusters with different seeds
##############
## libraries 
##############
library(base)
library(mvtnorm) 
library(mgcv)
library(R.matlab) 
##############
## arguments 
##############
# input arguments
args = commandArgs(trailingOnly=TRUE)
ambient.dimension.cluster1<-as.numeric(args[1]) 
ambient.dimension.cluster2<-as.numeric(args[2])
sample.size<-as.numeric(args[3]) 
Mean.cluster1<-as.numeric(args[4]) 
Mean.cluster2<-as.numeric(args[5]) 
Std<-as.numeric(args[6]) 
cluster.split<-as.numeric(args[7]) # size of smaller cluster default: 0.3
# output path
out.dir<-args[8] 
dir.create(out.dir, showWarnings = FALSE) 
################
## functions
################
sample.normal.cluster<-function(cluster.size,Mean,ambient.dimension,seed.count){
  print(" Sampling...")
  data.matrix<-matrix(0, nrow = cluster.size, ncol = ambient.dimension)
  sample.mean<-rep(Mean,ambient.dimension)
  sample.covariance.matrix<-diag(x=Std,ambient.dimension)
  for (i in 1:cluster.size){
    seed.count.loop<-i+seed.count
    set.seed(seed.count.loop) 
    data.matrix[i,]<-rmvnorm(n=1, sample.mean, sample.covariance.matrix)
  }
  return(data.matrix)
}
#(1)
cluster1.size<-ceiling(sample.size*cluster.split)
sample.data.cluster1<-sample.normal.cluster(cluster1.size,Mean.cluster1,ambient.dimension.cluster1,seed.count=0)

cluster2.size<-sample.size -ceiling(sample.size*cluster.split)
sample.data.cluster2<-sample.normal.cluster(cluster2.size,Mean.cluster2,ambient.dimension.cluster2,seed.count=(ambient.dimension.cluster2+1))

#(2)
if (ambient.dimension.cluster1 == ambient.dimension.cluster2){
  data.matrix<-rbind(sample.data.cluster1,sample.data.cluster2)
  f.sample<-paste0(out.dir,"/",ambient.dimension.cluster1,'ambientCluster1_',ambient.dimension.cluster2,'ambientCluster2_',sample.size,"sample_bimodal.mat")
  writeMat(con=f.sample,x=data.matrix)
}else{
  f.sample<-paste0(out.dir,"/",ambient.dimension.cluster1,'ambientCluster1_sample_bimodal.mat')
  writeMat(con=f.sample,x=sample.data.cluster1)
  f.sample<-paste0(out.dir,"/",ambient.dimension.cluster2,'ambientCluster2_sample_bimodal.mat')
  writeMat(con=f.sample,x=sample.data.cluster2)
}

print(" Done ")


