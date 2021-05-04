#----------------------- Histogram of range of neuronal response
## author: Annachiara Korchmaros
## comments: 
# (1) load 1 repeat from MICE dataset (fully or 1st step preprocessed)
# (2) for each neuron grab 10th and 90th percentile and compute the difference for each neuron
# (3) save the ranges
# (4) plot hist with log scale x-axis 
# (5) plot hist in linear scale zoom in by cutting it at the 10%-90%
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
f.data.all<-paste0(in.dir,"/",type.data,"_",mouse,".mat")
data.all <- readMat(f.data.all)  
if (type.data=="clean_signal"){
  data.stim<-data.all$signal # dimension 2800 8122
  data.stim.repeat<-data.stim[,,1] # grab 1st repeat
}else{
  data.stim<-data.all$stim[2]
  data.stim<-data.frame(data.stim)
  data.stim.repeat<-data.stim[1:(dim(data.stim)[1]/2),]
  data.stim.repeat<-as.matrix(data.stim.repeat)
}

#(2)
signal.range<-apply(data.stim.repeat,2, function(neuron) { quantile(neuron, c(.10, .90)) })
table.signal.range<-t(signal.range)
table.signal.range<-data.table(table.signal.range)
min.signal.range<-min(table.signal.range$`10%`) 
max.signal.range<-max(table.signal.range$`90%`)
dif.signal<-table.signal.range$`90%`-table.signal.range$`10%`
table.signal.range$range<-dif.signal

#(3)
stat<-data.table(table.signal.range$range)
names(stat)<-"range"
save(stat, file=paste0(out.dir.file,"/range_signal_",type.data,"_",mouse,".RData"))
#(4)
p<-ggplot(table.signal.range, aes(x=abs(range))) +
  geom_bar(bins=30,col="red", fill="yellow", alpha = .2,stat = "bin",aes(y = 100*(..count..)/sum(..count..))) +
  theme_minimal(base_size = 40) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  labs(title="", x="Range", y=" ")
if (type.data=="clean_signal"){
  ggsave(path = out.dir, filename = "fig11j.png",dpi=300)
}else{
  ggsave(path = out.dir, filename = "figS8j.png",dpi=300)
}

#(5)
max.x<-10 # change this with the value on readme
min.x<-0 # change this with the value on readme
p<-ggplot(table.signal.range, aes(x=range)) +
  geom_bar(bins=30,col="red", fill="yellow", alpha = .2,stat = "bin",aes(y = 100*(..count..)/sum(..count..))) +
  theme_minimal(base_size = 40) +
  scale_x_continuous(limits = c(min.x, max.x)) +
  labs(title="", x=" Range", y=" ")
if (type.data=="clean_signal"){
  ggsave(path = out.dir, filename = "fig11d.png",dpi=300)
}else{
  ggsave(path = out.dir, filename = "figS8d.png",dpi=300)
}


