#----------------------- Euclidean distance
## author: Annachiara Korchmaros
## comments: 
# (1) load data, ie 1 repeat from MICE dataset 
# (2) compute Euclidean distances
# (3) save it
#############
## libraries 
##############
library(base)
library(data.table)
library(R.matlab) 
library(parallelDist ) #distance


##############
## arguments 
##############
args = commandArgs(trailingOnly=TRUE)
mouse<-args[1]
type.data<-args[2] 
in.dir<-args[3] 
repeat.numb<-as.numeric(args[4]) 
out.dir<-args[5] 
###############
## functions
###############
makeSymm <- function(m) {
  m[upper.tri(m)] <- t(m)[upper.tri(m)]
  return(m)
}
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
  
  data.stim<-data.all$signal # dimension 2800 8122
  data.stim.repeat<-data.stim[,,repeat.numb] # grab repeat 
  
  matrix.stim.repeat<-as.matrix(data.frame(data.stim.repeat)) # data as matrix images x neurons
}
#(2)
paste0("Computing Euclidean distances..")
distance.matrix.low<-parDist(matrix.stim.resp, method = "euclidean") # The lower triangle of the distance matrix stored by columns in a vector
distance.matrix<-vec2sym(distance.matrix.low, diagonal = 0, lower = TRUE, byrow = FALSE)
#(3)
if (type.data =='NULL'){
  f.sample<-paste0(out.dir,"/",mouse,"_euclidean.mat")
}else{
  f.sample<-paste0(out.dir,"/repeat",repeat.numb,"_",type.data,"_",mouse,"_euclidean.mat")
}
writeMat(con=f.sample,x=distance.matrix)
print("Done")
