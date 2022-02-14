#----------------------- Change format
## author: Annachiara Korchmaros
## comments: 
# (1) load data as .mat
# (2) save as .txt
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
f.data<-args[1] 
in.dir<-args[2] 
out.dir<-in.dir
###############
## steps
###############
#(1)
f.data.all<-paste0(in.dir,"/",f.data,"_euclidean.mat")
data.all <- readMat(f.data.all)  
matrix.stim.repeat<-data.all$x
#(2)
colnames(matrix.stim.repeat)<-NULL
#(3)
f.sample<-paste0(out.dir,"/",f.data,"_euclidean.txt")
fwrite(matrix.stim.repeat, file=f.sample,sep = "\t",eol = "\n",row.names = FALSE, col.names = FALSE)
print("Done")




