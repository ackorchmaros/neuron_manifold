#--------------------------------------Sampling 1 repeat from Segre variety away from the origin (singular point)
## author: Annachiara Korchmaros
## comments: 
#(1) choose 2 pairs of vectors (x,y) from two standard multivariate normal distributions
#(2) get their segre product, ie (x1y1,x1y2,....) 
#(3) check first coordinate isn't zero (check vectors first coordinate) and resample eventually (optional)
#(4) pass to nonhomogeous coordinates and check points are projective different and resample eventually (optional)
#(5) save 3000 sample size
#(6) subsample 2 repeats of 300 samples each from (6) randomly
#(7) subsample 2 repeats of 30 samples each from (6) randomly
##############
## libraries 
##############
library(base)
library(R.matlab) 
library(mvtnorm) 
library(mgcv)
##############
## arguments 
##############
# input arguments
args = commandArgs(trailingOnly=TRUE)
ambient.dimension<-as.numeric(args[1])
sample.size<-as.numeric(args[2]) 
# output path
out.dir<-args[3]
dir.create(out.dir, showWarnings = FALSE) 
Mean<-as.numeric(args[4]) 
# other parameters
vector.length<-sqrt(ambient.dimension)
segre.dimension<-(vector.length-1)*2+1
##############
## function
##############
# Segre product
segre.product<-function(x,y){
  S<-NULL
  for (i in 1:length(x)){
      S<-append(S,x[i]*y)
  }
  return(S)
}
################
## steps
################
sample.segre<-matrix(0, nrow = sample.size, ncol = ambient.dimension)
sample.mean<-rep(Mean,vector.length)
sample.covariance.matrix<-diag(vector.length)

print("Sampling..")
for (i in 1:sample.size){
  #(1)
  set.seed(i) 
  x<-rmvnorm(n=1, sample.mean, sample.covariance.matrix)
  set.seed(i+sample.size) 
  y<-rmvnorm(n=1, sample.mean, sample.covariance.matrix)
  x.S.y<-segre.product(x,y) #(2)
  sample.segre[i,]<-x.S.y
}
#(3) 
#length(which(sample.segre[,1]==0)) # none
#(4) 
#nonH.sample.segre<-sample.segre/sample.segre[,1]
#no.duplicats.nonH.sample.segre<-uniquecombs(nonH.sample.segre) # all points are projectively different

#(5)
f.sample.segre<-paste0(out.dir,"/",ambient.dimension,'ambient_',sample.size,"sample_",segre.dimension,"segre.mat")
writeMat(con=f.sample.segre,x=sample.segre)

#(6) 
# subsample.size<-300
# set.seed(170714) # mouse tag
# index.subsample<-sample.int(sample.size, subsample.size) #integer version of sample function
# subsample.segre<-sample.segre[index.subsample,]
# 
# f.subsample.segre<-paste0(out.dir,"/",ambient.dimension,'ambient_',subsample.size,"sample_",segre.dimension,"segre.mat")
# writeMat(con=f.subsample.segre,x=subsample.segre)

#(7)
# subsample.size<-30
# set.seed(170715) 
# index.subsample<-sample.int(sample.size, subsample.size)
# subsample.segre<-sample.segre[index.subsample,]
# 
# f.subsample.segre<-paste0(out.dir,"/",ambient.dimension,'ambient_',subsample.size,"sample_",segre.dimension,"segre.mat")
# writeMat(con=f.subsample.segre,x=subsample.segre)

