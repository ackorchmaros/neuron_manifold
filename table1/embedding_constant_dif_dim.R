#--------------------------------------Embedding with constant value for different cluster dimension
## author: Annachiara Korchmaros
## comments: 
#(1) load NxM matrix
#(2) add a constant value in each row
#(3) save as .mat
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
ambient.dimension<-as.numeric(args[1]) 
constant.value<-as.numeric(args[2])
in.dir<-args[3] 
f.cluster1<-args[4] 
f.cluster2<-args[5] 
# output path
out.dir<-in.dir 
##############
## steps 
##############
#(1)
f.data.all<-paste0(in.dir,"/",f.cluster1,".mat")
data.all <- readMat(f.data.all)  
data.cluster1<-data.all$x

f.data.all<-paste0(in.dir,"/",f.cluster2,".mat")
data.all <- readMat(f.data.all)  
data.cluster2<-data.all$x
#(2)
constant.matrix.cluster1<-matrix(constant.value, nrow = dim(data.cluster1)[1], ncol = ambient.dimension-dim(data.cluster1)[2])
data.constant.matrix.cluster1<-cbind(data.cluster1,constant.matrix.cluster1)

constant.matrix.cluster2<-matrix(constant.value, nrow = dim(data.cluster2)[1], ncol = ambient.dimension-dim(data.cluster2)[2])
data.constant.matrix.cluster2<-cbind(data.cluster2,constant.matrix.cluster2)

data.constant.matrix<-rbind(data.constant.matrix.cluster1,data.constant.matrix.cluster2)
#(3)
f.data.constant.matrix<-paste0(out.dir,"/",dim(data.cluster1)[2],"ambientCluster1_", f.cluster2,"_embedded_const.mat")
writeMat(con=f.data.constant.matrix,x=data.constant.matrix)
print(" Done ")


