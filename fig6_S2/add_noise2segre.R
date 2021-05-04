#--------------------------------------Add random noise to Segre sample to make 2 repeats
## author: Annachiara Korchmaros
## comments: 
#(1) load data matrices with 3000,300, or 30 samples 
#(2) add noise from multivariate normal with different seed for each image 
#(3) centralize repeats
#(4) check correlation between repeats is 0.21 (you can tune mean and std by checking this!)
#(5) print correlation
#(6) save repeats
##############
## libraries 
##############
library(base)
library(R.matlab) 
library(Rfast)
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
mean<-as.numeric(args[4]) 
std<-as.numeric(args[5])
# other parameters
if (ambient.dimension== 70 | ambient.dimension== 40){
  vector.length<-sqrt(100)
}else{
  vector.length<-sqrt(ambient.dimension)
}
segre.dimension<-(vector.length-1)*2+1
##############
## functions
##############
# center by column
## source: https://www.gastonsanchez.com/visually-enforced/how-to/2014/01/15/Center-data-in-R/
center_apply <- function(x) {
  apply(x, 2, function(y) y - mean(y))
}
##############
## steps
##############
#(1) 
f.case.data<-paste0(out.dir,"/",ambient.dimension,"ambient_",sample.size,'sample_',segre.dimension,'segre.mat')
case.data <- readMat(f.case.data) 
case.data<-case.data$x
#(2) 
sample.mean<-rep(0,ambient.dimension)
sample.covariance.matrix<-diag(std,ambient.dimension)
sample.segre.repeat1<-matrix(0, nrow = sample.size, ncol = ambient.dimension)
sample.segre.repeat2<-matrix(0, nrow = sample.size, ncol = ambient.dimension)

print("Sampling..")
for (i in 1:(sample.size*2)) {
  set.seed(i)
  noise.repeat1<-rmvnorm(n=ambient.dimension,mean, std)
  noise.repeat2<-rmvnorm(n=ambient.dimension, mean, std)
  if (i<=sample.size){
    sample.segre.repeat1[i,]<-case.data[i,]+noise.repeat1
  }else{
    sample.segre.repeat2[(i-sample.size),]<-case.data[(i-sample.size),]+noise.repeat2
  }
}

#(3)
sample.segre<-rbind(sample.segre.repeat1,sample.segre.repeat2)
sample.segre.cent<-center_apply(sample.segre)
sample.segre.repeat1<-sample.segre.cent[1:sample.size,]
sample.segre.repeat2<-sample.segre.cent[(sample.size+1):(2*sample.size),]

#(4) 
correlation<-cor(as.vector(sample.segre.repeat1),as.vector(sample.segre.repeat2))
print(paste0('The correlation between repeats is ',correlation))

#(5) save
f.case.data<-paste0(out.dir,"/",ambient.dimension,"ambient_",sample.size,'sample_',segre.dimension,'segre_repeat1.mat')
writeMat(con=f.case.data,repeat1=sample.segre.repeat1)
f.case.data<-paste0(out.dir,"/",ambient.dimension,"ambient_",sample.size,'sample_',segre.dimension,'segre_repeat2.mat')
writeMat(con=f.case.data,repeat2=sample.segre.repeat2)