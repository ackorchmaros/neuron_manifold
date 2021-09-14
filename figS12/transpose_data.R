#----------------------- Transpose data matrix
## author: Annachiara Korchmaros
## comments: 
# (1) load data, ie 1 repeat from MICE dataset (fully or 1st step preprocessed)
# (2) transpose marix
# (3) save
#############
## libraries 
##############
library(base)
library(data.table)
library(R.matlab) 
##############
## arguments 
##############
args = commandArgs(trailingOnly=TRUE)
mouse<-args[1]
type.data<-args[2] 
in.dir<-args[3] 
repeat.numb<-as.numeric(args[4]) 
###############
## steps
###############
#(1)
if (type.data =='NULL'){
  f.data.all<-paste0(in.dir,"/",mouse,".mat")
  data.all <- readMat(f.data.all)  
  matrix.stim.repeat<-data.all$x
}else{
  f.data.all<-paste0(in.dir,"/",type.data,"_",mouse,".mat")
  data.all <- readMat(f.data.all)  
  
  data.stim<-data.all$signal 
  data.stim.repeat<-data.stim[,,repeat.numb] 
  
  matrix.stim.repeat<-as.matrix(data.frame(data.stim.repeat))
}
#(2)
t.matrix.stim.repeat<-t(matrix.stim.repeat)
#(3)
f.sample<-paste0(in.dir,"/repeat",repeat.numb,"_",type.data,"_",mouse,"_t.mat")
writeMat(con=f.sample,x=t.matrix.stim.repeat)
print("Done")
