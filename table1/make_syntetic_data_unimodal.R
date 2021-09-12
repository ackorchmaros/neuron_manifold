#--------------------------------------Sampling from a unimodal distribution
## author: Annachiara Korchmaros
## comments: 
#(1) sample N multivariate normal distribution with dimension M
#(2) save in Nx M matrix
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
ambient.dimension<-as.numeric(args[1]) # 100
sample.size<-as.numeric(args[2]) #3000
Mean<-as.numeric(args[3]) # 0
Std<-as.numeric(args[4]) #1
# output path
out.dir<-args[5] 
dir.create(out.dir, showWarnings = FALSE) 
################
## steps
################
data.matrix<-matrix(0, nrow = sample.size, ncol = ambient.dimension)
sample.mean<-rep(Mean,ambient.dimension)
sample.covariance.matrix<-diag(x=Std,ambient.dimension)

print(" Sampling...")
for (i in 1:sample.size){
  #(1) 
  set.seed(i) 
  data.matrix[i,]<-rmvnorm(n=1, sample.mean, sample.covariance.matrix)
}
#(2) 
f.sample<-paste0(out.dir,"/",ambient.dimension,'ambient_',sample.size,"sample_unimodal.mat")
writeMat(con=f.sample,x=data.matrix)
print(" Done ")


