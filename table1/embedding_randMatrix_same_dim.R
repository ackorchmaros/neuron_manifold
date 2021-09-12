#--------------------------------------Embedding with random matrix for same cluster dimension
## author: Annachiara Korchmaros
## comments: 
#(1) load NxM matrix
#(2) sample a random 0-1 matrix Mx ambient dimension
#(3) multiply matrix to ger Nx ambient dimension
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
in.dir<-args[2] 
sample.data<-args[3]
# output path
out.dir<-in.dir 
##############
## steps 
##############
#(1)
f.data.all<-paste0(in.dir,"/",sample.data,".mat")
data.all <- readMat(f.data.all)  
data<-data.all$x

#(2) source:http://www.rexamples.com/14/Sample()
m0 <- matrix(0, dim(data)[2], ambient.dimension)
rand.matrix<-apply(m0, c(1,2), function(x) sample(c(0,1),1)) 

#(3)
data.rand.matrix<-data %*% rand.matrix

#(4)
f.data.rand.matrix<-paste0(out.dir,"/",sample.data,"_embedded_randMatrix.mat")
writeMat(con=f.data.rand.matrix,x=data.rand.matrix)
print(" Done ")


