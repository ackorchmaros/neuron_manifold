#----------------------- Hopkins test
## author: Annachiara Korchmaros
## comments: 
# (1) load data where samples are ordered in rows, ie 1 repeat from MICE dataset (fully or 1st step preprocessed)
# (2) compute subsample size =10% of sample size 
# (3) run the test
#############
## libraries 
##############
library(base)
library(data.table)
library(R.matlab) 
library(clustertend)
##############
## arguments 
##############
args = commandArgs(trailingOnly=TRUE)
mouse<-args[1]
type.data<-args[2] 
in.dir<-args[3] 
sampling.rate<-as.numeric(args[4]) # 10
repeat.numb<-as.numeric(args[5]) # 1
###############
## steps
###############
#(1)
if (type.data =='NULL'){
  f.data.all<-paste0(in.dir,"/",mouse,".mat")
  data.all <- readMat(f.data.all)  
  data.stim.repeat<-data.all$x
}else{
  f.data.all<-paste0(in.dir,"/",type.data,"_",mouse,".mat")
  data.all <- readMat(f.data.all)  
  
  data.stim<-data.all$signal # dimension 2800 8122
  data.stim.repeat<-data.stim[,,repeat.numb] # grab repeat 
}
#(2)
n=dim(data.stim.repeat)[1]*sampling.rate/100

#(3)
paste0("Running Hopkins test ..")
test.answer<-hopkins(data.stim.repeat, n, byrow = F, header = T) #the variables is taken by column and samples by row 
test.answer<-test.answer$H 
if (test.answer>0.05){
  paste0("The dataset is unclusterable via Hopkins with p.value=",test.answer)
}else{
  paste0("The dataset is clusterable via Hopkins with p.value=",test.answer )
}