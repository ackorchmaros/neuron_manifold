#--------------------------------------Sampling from Segre variety uniformly with 2 clusters away from the origin (singular point)
## author: Annachiara Korchmaros
## comments: 
#(1) choose 2 pairs of vectors (x,y) with from a uniform distribution
#(2) get their segre product, ie (x1y1,x1y2,...) 
#(3) check all samples are away from the origin
#(4) repeat 1-3 for cluster 1 and cluster 2 choosing different parameters for the uniform
#(5) save as .mat file 
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
vector.length<-as.numeric(args[1]) 
sample.size<-as.numeric(args[2]) 
min.signal.cluster1<-as.numeric(args[3]) 
max.signal.cluster1<-as.numeric(args[4]) 
min.signal.cluster2<-as.numeric(args[5]) 
max.signal.cluster2<-as.numeric(args[6]) 
cluster.split<-as.numeric(args[7]) # size of smaller cluster default: 0.3
# output path
out.dir<-args[8] 
dir.create(out.dir, showWarnings = FALSE) 
# other parameters
ambient.dimension<-vector.length^2
segre.dimension<-(vector.length-1)*2+1
##############
## functions
##############
# segre product
segre.product<-function(x,y){
  S<-NULL
  for (i in 1:length(x)){
    S<-append(S,x[i]*y)
  }
  return(S)
}

# sample clusters uniformly
sample.unif.cluster<-function(cluster.size,min.signal, max.signal){
  sample.segre<-matrix(0, nrow = cluster.size, ncol = ambient.dimension)
  print(" Sampling Cluster...")
  for (i in 1:cluster.size){
    #(1) 
    set.seed(i) 
    x<-runif(n=vector.length, min = min.signal, max = max.signal)
    set.seed(i+sample.size) 
    y<-runif(n=vector.length, min = min.signal, max = max.signal)
    #(2) 
    x.S.y<-segre.product(x,y)
    sample.segre[i,]<-x.S.y
  }
  #(3) 
  length(which(sample.segre[,1]==0)) # none
  return(sample.segre)
}

################
## make samples
################
#(4)
cluster1.size<-ceiling(sample.size*cluster.split)
sample.segre.cluster1<-sample.unif.cluster(cluster1.size,min.signal.cluster1,max.signal.cluster1)

cluster2.size<-sample.size -ceiling(sample.size*cluster.split)
sample.segre.cluster2<-sample.unif.cluster(cluster2.size,min.signal.cluster2,max.signal.cluster2)

sample.segre<-rbind(sample.segre.cluster1,sample.segre.cluster2)
#(5) 
f.sample.segre<-paste0(out.dir,"/",ambient.dimension,'ambient_',sample.size,"sample_",segre.dimension,"segre_2clusterUniformSample.mat")
writeMat(con=f.sample.segre,x=sample.segre)
print("Done")

