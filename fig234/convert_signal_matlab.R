#----------------------- CONVERT FORMAT
## author: Annachiara Korchmaros
## comments: 
# (1) load responses of 1 mouse from MICE DATASET
# (2) save as matrix 2(numb. stimuli) x numb. neurons
# (3) save as .mat
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
mouse<-args[1] # default:"M170714_MP032_2017-08-07"
in.dir<-args[2] # '~/Desktop/neuron_manifold/data' !!!!!! update in.dir
# output path
out.dir<-in.dir 
dir.create(out.dir, showWarnings = FALSE)
###############
## steps
###############
#(1)
f.data.all<-paste0(in.dir,"/clean_signal_",mouse,".mat")
data.all <- readMat(f.data.all)  
#(2)
data.stim<-data.all$signal 
data.stim.repeat1<-data.stim[,,1] # grab 1st repeat : dimension 2800 8122
data.stim.repeat2<-data.stim[,,2] 
data.stim.all<-rbind(data.stim.repeat1,data.stim.repeat2)
#(3)
f.data.stim.repeat<-paste0(out.dir,"/2repeat_clean_signal_",mouse,".mat")
writeMat(con=f.data.stim.repeat,x=data.stim.all)