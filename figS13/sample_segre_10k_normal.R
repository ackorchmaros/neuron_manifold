#--------------------------------------Sampling from Segre variety in 10k-dim space with multivariate Gaussian distribution away from the origin (singular point)
## author: Annachiara Korchmaros
## comments: 
#(1) choose 2 pairs of vectors (x,y) from two standard multivariate normal distribution with non-zero vector mean
#(2) get their segre product, ie (x1y1,x1y2,...) 
# repeat 1-2 equal to the sample size
#(3) check all samples are away from the origin
#(4) save as .mat file 
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
Mean<-as.numeric(args[3]) 
Std<-as.numeric(args[4]) 
# output path
out.dir<-args[5] 
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
################
## make samples
################
sample.segre<-matrix(0, nrow = sample.size, ncol = ambient.dimension)
sample.mean<-rep(Mean,vector.length)
sample.covariance.matrix<-diag(x=Std,vector.length)

print(" Sampling...")
for (i in 1:sample.size){
  #(1) 
  set.seed(i) 
  x<-rmvnorm(n=1, sample.mean, sample.covariance.matrix)
  set.seed(i+sample.size) 
  y<-rmvnorm(n=1, sample.mean, sample.covariance.matrix)
  #(2) 
  x.S.y<-segre.product(x,y)
  sample.segre[i,]<-x.S.y
}
#(3) 
length(which(sample.segre[,1]==0)) # expect none
#(4) 
f.sample.segre<-paste0(out.dir,"/",ambient.dimension,'ambient_',sample.size,"sample_",segre.dimension,"segre_normalSample.mat")
writeMat(con=f.sample.segre,x=sample.segre)
print("Done")


