#----------------------- Dip-dist tests
## author: Annachiara Korchmaros
## comments: 
# (1) load data, ie 1 repeat from MICE dataset 
# (2) compute Euclidean distances
# (3) sort distances
# (4) run the tests
#############
## libraries 
##############
library(base)
library(data.table)
library(R.matlab) 
library(parallelDist ) 
library(diptest)
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
paste0("Computing Euclidean distances..")
distance.matrix.low<-parDist(matrix.stim.repeat, method = "euclidean") 

#(3)
order.distance.matrix.low<-sort(distance.matrix.low)

#(4)
paste0("Running dip-test with linear interpolation ..")
d.t.liner.int <- dip.test(order.distance.matrix.low,simulate.p.value = F)  
if (d.t.liner.int$p.value>0.05){
  paste0("The dataset is unclusterable via linear interpolation with p.value=",d.t.liner.int$p.value)
}else if(d.t.liner.int$p.value==0){
  paste0("The dataset is clusterable via linear interpolation with p.value< 2.2e-16")
}else{
  paste0("The dataset is clusterable via linear interpolation with p.value==",d.t.liner.int$p.value )
}
paste0("Running dip-test with Monte Carlo simulations ..")
d.t.montecarlo <- dip.test(order.distance.matrix.low,simulate.p.value = T)
if (d.t.montecarlo$p.value>0.05){
  paste0("The dataset is unclusterable via Monte Carlo simulation of a uniform distribution with p.value=",d.t.montecarlo$p.value)
}else if (d.t.montecarlo$p.value==0){
  paste0("The dataset is clusterable via Monte Carlo simulation of a uniform distribution with p.value< 2.2e-16")
}else{paste0("The dataset is clusterable via Monte Carlo simulation of a uniform distribution with p.value=",d.t.montecarlo$p.value)
}

