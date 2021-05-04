#--------------------------------------Sampling from og in 10k-dim space uniformly in 2 intervals
## author: Annachiara Korchmaros
## comments: 
#(1) define a nxn matrix M with columns iid selected randomly from uniform distribution with n rv with a given range
#(2) do the QR factorization of M, ie M=QR 
#(3) vectorize the matrix Q by columns (if you do it by rows it gives you another point which is the one you d obtain by vectorizing the inverse by rows) and save it as row
# repeat 1-3 for each sample
# repeat in each cluster
#(4) save on sample size x n^2 matrix, the dimension is n(n-1)/2
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
sample.size<-as.numeric(args[2]) 
min.signal.cluster1<-as.numeric(args[3])
max.signal.cluster1<-as.numeric(args[4]) 
min.signal.cluster2<-as.numeric(args[5]) 
max.signal.cluster2<-as.numeric(args[6]) 
cluster.split<-as.numeric(args[7]) 
# output path
out.dir<-args[8] 
dir.create(out.dir, showWarnings = FALSE) 
# other parameters
dim.M<-sqrt(ambient.dimension) 
og.dimension<-dim.M*(dim.M-1)/2
##############
## functions
##############
## qr-decomposition-gram-schmidt
## from https://rpubs.com/aaronsc32/qr-decomposition-gram-schmidt
gramschmidt <- function(x) {
  x <- as.matrix(x)
  # Get the number of rows and columns of the matrix
  n <- ncol(x)
  m <- nrow(x)
  
  # Initialize the Q and R matrices
  q <- matrix(0, m, n)
  r <- matrix(0, n, n)
  
  for (j in 1:n) {
    v = x[,j] # Step 1 of the Gram-Schmidt process v1 = a1
    # Skip the first column
    if (j > 1) {
      for (i in 1:(j-1)) {
        r[i,j] <- t(q[,i]) %*% x[,j] # Find the inner product (noted to be q^T a earlier)
        # Subtract the projection from v which causes v to become perpendicular to all columns of Q
        v <- v - r[i,j] * q[,i] 
      }      
    }
    # Find the L2 norm of the jth diagonal of R
    r[j,j] <- sqrt(sum(v^2))
    # The orthogonalized result is found and stored in the ith column of Q.
    q[,j] <- v / r[j,j]
  }
  
  # Collect the Q and R matrices into a list and return
  qrcomp <- list('Q'=q, 'R'=r)
  return(qrcomp)
}

# sample clusters uniformly
sample.unif.cluster<-function(cluster.size,min.signal, max.signal){
  print(" Sampling Cluster...")
  sample.og<-matrix(0, nrow = cluster.size, ncol = ambient.dimension)
  count.seed<-0
  for (i in 1:cluster.size){
    #(1) define M
    #repeat {
      M<-matrix(0, nrow=dim.M,ncol = dim.M)
      for (j in 1:dim.M){
        count.seed<-count.seed +1
        set.seed(count.seed) 
        M.col<-runif(n=dim.M, min = min.signal, max = max.signal)
        M[,j]<-M.col}
      #(2) QR factorization
      QR=gramschmidt(M)
      Q<-QR$Q
      #(3) detQ=1
      #condition<- abs(det(Q)-1)<=tol && isTRUE(all.equal(Q%*%t(Q),diag(dim.M)))
      #if(condition ) break
    #}          
    #(4) vectorize the matrix Q by rows & save it as row in the output matrix
    sample.og[i,]<-as.vector(Q)
  }  
  return(sample.og)
}
################
## make samples
################
# (1)-(3) cluster 1
cluster1.size<-ceiling(sample.size*cluster.split)
sample.og.cluster1<-sample.unif.cluster(cluster1.size,min.signal.cluster1,max.signal.cluster1)
# (1)-(3) cluster 2
cluster2.size<-sample.size -ceiling(sample.size*cluster.split)
sample.og.cluster2<-sample.unif.cluster(cluster2.size,min.signal.cluster2,max.signal.cluster2)

sample.og<-rbind(sample.og.cluster1,sample.og.cluster2)
#(4) save 
f.sample.og<-paste0(out.dir,"/",ambient.dimension,'ambient_',sample.size,"sample_",og.dimension,"og_2clusterUniformSample.mat")
writeMat(con=f.sample.og,x=sample.og)
print("Done")


