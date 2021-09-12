#--------------------------------------Embedding with constant value for same cluster dimension
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
ambient.dimension<-as.numeric(args[1]) # 10000
constant.value<-as.numeric(args[2])
in.dir<-args[3] 
sample.data<-args[4]
# output path
out.dir<-in.dir 
##############
## steps 
##############
#(1)
f.data.all<-paste0(in.dir,"/",sample.data,".mat")
data.all <- readMat(f.data.all)  
data<-data.all$x

#(2)
constant.matrix<-matrix(constant.value, nrow = dim(data)[1], ncol = ambient.dimension-dim(data)[2])
data.constant.matrix<-cbind(data,constant.matrix)
#(3)
f.data.constant.matrix<-paste0(out.dir,"/",sample.data,"_embedded_const.mat")
writeMat(con=f.data.constant.matrix,x=data.constant.matrix)
print(" Done ")


