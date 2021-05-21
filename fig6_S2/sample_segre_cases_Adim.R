#--------------------------------------Sampling from Segre Variety of dimension 19 in a space of dimension 70 and 40
## author: Annachiara Korchmaros
## comments: 
#(1) load data matrices with 3000,300, or 30 samples for the 100 ambient space case
#(2) for each row select 1:10 and 11,21,..,91 indices to keep the dimension of the Segre variety equal to 20
#(3) for each row select 51, 21 more columns randomly but none from (2)
#(4) save 
##############
## libraries 
##############
library(base)
library(R.matlab) 
##############
## arguments 
##############
# input args
args = commandArgs(trailingOnly=TRUE)
ambient.dimension<-as.numeric(args[1]) 
sample.size<-as.numeric(args[2]) 
# output path
out.dir<-args[3] 
dir.create(out.dir, showWarnings = FALSE) 
##############
## steps
##############
#(1) 
f.th.case.data<-paste0(out.dir,"/100ambient_",sample.size,'sample_19segre.mat')
th.case.data <- readMat(f.th.case.data) 
th.case.data<-th.case.data$x
#(2) 
fixed.indeces<-c(1:10,seq(11,91,10))
#(3) 
all.indeces<-1:dim(th.case.data)[2]
remaning.indeces<-all.indeces[-fixed.indeces]
set.seed(170714) # mouse tag
random.indeces<-sample(remaning.indeces,(ambient.dimension-length(fixed.indeces))) #without replacement 
#(4) save
sample.segre<-th.case.data[,c(fixed.indeces,random.indeces)]
# mean
sample.segre<-th.case.data[,c(fixed.indeces,random.indeces)]

f.sample.segre<-paste0(out.dir,"/",ambient.dimension,'ambient_',sample.size,"sample_19segre.mat")
writeMat(con=f.sample.segre,x=sample.segre)