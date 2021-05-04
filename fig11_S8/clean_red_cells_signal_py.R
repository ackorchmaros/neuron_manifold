#----------------------- Format 1st step preprocessing data for python
## author: Annachiara Korchmaros
## comments: 
# (1) load data from 1 mouse
# (2) save as matrix
#############
## libraries 
##############
library(base)
library(ggplot2)  
library(data.table)
library(R.matlab) 
library(scales) # to access break formatting functions
##############
## arguments 
##############
args = commandArgs(trailingOnly=TRUE)
mouse<-args[1] 
in.dir<-args[2] 
# output path
out.dir<-args[3] 
dir.create(out.dir, showWarnings = FALSE)
###############
## steps
###############
f.data.all<-paste0(in.dir,"/clean_redCells_signal_",mouse,".mat")
data.all <- readMat(f.data.all)  

data.stim<-data.all$stim[2]
data.stim<-data.frame(data.stim)
data.stim.repeat<-data.stim[1:(dim(data.stim)[1]/2),]
data.stim.repeat<-as.matrix(data.stim.repeat)

write.csv2(t(data.stim.repeat),paste0(out.dir,"/4py_clean_redCells_signal_",mouse,".csv"),row.names = F)
