#----------------------- Histogram of median of neuronal response
## author: Annachiara Korchmaros
## comments: 
# (1) load 1 repeat from MICE dataset (fully or 1st step preprocessed)
# (2) median each column=neuron
# (3) save median
# (4) plot hist with log scale x-axis 
# (5) plot hist in linear scale zoom in by cutting it at the 10%-90%
#############
## libraries 
##############
library(base)
library(ggplot2) 
library(data.table)
library(scales) # to access break formatting functions
library(R.matlab) 
##############
## arguments 
##############
args = commandArgs(trailingOnly=TRUE)
mouse<-args[1] 
type.data<-args[2] 
in.dir<-args[3] 
# output path
out.dir<-args[4]
dir.create(out.dir, showWarnings = FALSE)
out.dir.file<-args[5] 
dir.create(out.dir, showWarnings = FALSE)
###############
## steps
###############
#(1)
f.data.all<-paste0(in.dir,"/",type.data,"_",mouse,".mat")
data.all <- readMat(f.data.all)  
if (type.data=="clean_signal"){
  data.stim<-data.all$signal 
  data.stim.repeat<-data.stim[,,1] 
}else{
  data.stim<-data.all$stim[2]
  data.stim<-data.frame(data.stim)
  data.stim.repeat<-data.stim[1:(dim(data.stim)[1]/2),]
  data.stim.repeat<-as.matrix(data.stim.repeat)
}

#(2)
data.stim.repeat<-data.table(data.stim.repeat)
median.neuron.signal<-apply(data.stim.repeat,2,median)
table.median.neuron.signal<-data.table('median.signal'=median.neuron.signal)
#(3)
stat<-table.median.neuron.signal
save(stat, file=paste0(out.dir.file,"/Median_signal_",type.data,"_",mouse,".RData"))
#(4)
p<-ggplot(table.median.neuron.signal, aes(x=abs(median.signal))) +
  geom_bar(bins=30,col="red", fill="yellow", alpha = .2,stat = "bin",aes(y = 100*(..count..)/sum(..count..))) +
  theme_minimal(base_size = 40) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  labs(title="", x="Median", y=" ")
if (type.data=="clean_signal"){
  ggsave(path = out.dir, filename = "fig11h.png",dpi=300)
}else{
  ggsave(path = out.dir, filename = "figS8h.png",dpi=300)
}


#(5)
max.x<-0.2 # change this with the value on readme
min.x<--2 # change this with the value on readme
p<-ggplot(table.median.neuron.signal, aes(x=median.signal)) +
  geom_bar(bins=30,col="red", fill="yellow", alpha = .2,stat = "bin",aes(y = 100*(..count..)/sum(..count..))) +
  theme_minimal(base_size = 40) +
  scale_x_continuous(limits = c(min.x, max.x)) +
  labs(title="", x="Median", y="")
if (type.data=="clean_signal"){
  ggsave(path = out.dir, filename = "fig11b.png",dpi=300)
}else{
  ggsave(path = out.dir, filename = "figS8b.png",dpi=300)
}




