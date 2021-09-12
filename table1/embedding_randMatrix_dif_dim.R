#--------------------------------------Embedding with random matrix for different cluster dimension
## author: Annachiara Korchmaros
## comments: 
#(1) load cluster 1 N1xM1 matrix and cluster 2 N2xM2 matrix
#(2) sample 2 random 0-1 matrices M1x ambient dimension and M2x ambient dimension
#(3) multiply matrices to get Nx ambient dimension
#(4) join clusters
#(5) save as .mat
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
f.cluster1<-args[3] 
f.cluster2<-args[4]
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

#(2) source:http://www.rexamples.com/14/Sample()
m0 <- matrix(0, dim(data.cluster1)[2], ambient.dimension)
rand.matrix.cluster1<-apply(m0, c(1,2), function(x) sample(c(0,1),1)) 

m0 <- matrix(0, dim(data.cluster2)[2], ambient.dimension)
rand.matrix.cluster2<-apply(m0, c(1,2), function(x) sample(c(0,1),1)) 

#(3)
data.rand.matrix.cluster1<-data.cluster1 %*% rand.matrix.cluster1
data.rand.matrix.cluster2<-data.cluster2 %*% rand.matrix.cluster2

data.rand.matrix<-rbind(data.rand.matrix.cluster1,data.rand.matrix.cluster2)

#(4)
f.data.rand.matrix<-paste0(out.dir,"/",dim(data.cluster1)[2],"ambientCluster1_", f.cluster2,"_embedded_randMatrix.mat")
writeMat(con=f.data.rand.matrix,x=data.rand.matrix)
print(" Done ")


