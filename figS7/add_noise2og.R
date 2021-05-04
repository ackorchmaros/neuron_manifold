#--------------------------------------Add random noise to orthogonal group sample to make 2 repeats
## Created by Annachiara Korchmaros 19/4/2021, Aalto
## Updated by Annachiara Korchmaros 19/4/2021, Aalto
## comments: 
#(1) load data matrices with 3000,300, or 30 samples for the 10k ambient space case
#(2) add noise from multivariate normal with different seed for each image st the correlation is 0.2
#(3) centralize by columns
#(4) compute correlation between repeats
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
# input args
args = commandArgs(trailingOnly=TRUE)
ambient.dimension<-as.numeric(args[1]) # 10000
sample.size<-as.numeric(args[2]) # 3000,300,30
# output path
out.dir<-args[3] #'~/Desktop/dimensionality/data/og'
dir.create(out.dir, showWarnings = FALSE) 
mean<-as.numeric(args[4]) # 
std<-as.numeric(args[5]) # 

# other parameters
dim.M<-sqrt(ambient.dimension) # 100
og.dimension<-dim.M*(dim.M-1)/2
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
#(1) load og sample
f.case.data<-paste0(out.dir,"/",ambient.dimension,"ambient_",sample.size,'sample_',og.dimension,'og.mat')
case.data <- readMat(f.case.data) 
case.data<-case.data$x
#(2) add noise from multivariate normal with different seed for each image
sample.mean<-rep(0,ambient.dimension)
sample.covariance.matrix<-diag(std,ambient.dimension)
sample.og.repeat1<-matrix(0, nrow = sample.size, ncol = ambient.dimension)
sample.og.repeat2<-matrix(0, nrow = sample.size, ncol = ambient.dimension)
print("Sampling..")
for (i in 1:(sample.size*2)) {
  set.seed(i)
  noise.repeat1<-rmvnorm(n=ambient.dimension,mean, std)
  noise.repeat2<-rmvnorm(n=ambient.dimension, mean, std)
  if (i<=sample.size){
    sample.og.repeat1[i,]<-case.data[i,]+noise.repeat1
  }else{
    sample.og.repeat2[(i-sample.size),]<-case.data[(i-sample.size),]+noise.repeat2
  }
}
#(3) centralize
sample.og<-rbind(sample.og.repeat1,sample.og.repeat2)
sample.og.cent<-center_apply(sample.og)
sample.og.repeat1<-sample.og.cent[1:sample.size,]
sample.og.repeat2<-sample.og.cent[(sample.size+1):(2*sample.size),]
#(4) compute correlation between repeats
correlation<-cor(as.vector(sample.og.repeat1),as.vector(sample.og.repeat2))
print(paste0('The correlation between repeats is ',correlation))
#(5) save
f.case.data<-paste0(out.dir,"/",ambient.dimension,"ambient_",sample.size,'sample_',og.dimension,'og_repeat1.mat')
writeMat(con=f.case.data,repeat1=sample.og.repeat1)
f.case.data<-paste0(out.dir,"/",ambient.dimension,"ambient_",sample.size,'sample_',og.dimension,'og_repeat2.mat')
writeMat(con=f.case.data,repeat2=sample.og.repeat2)