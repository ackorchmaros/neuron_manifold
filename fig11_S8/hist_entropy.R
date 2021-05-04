#----------------------- Histogram of naive entropy neuronal response
## author: Annachiara Korchmaros
## comments: 
# (1) load statistic
# (2) plot hist with log scale x-axis 
# (3) plot hist in linear scale zoom in by cutting it at the 10%-90%
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
statistics<-args[4] 
# output path
out.dir<-args[5] 
dir.create(out.dir, showWarnings = FALSE)
###############
## steps
###############
#(1)
stat<-read.table(file=paste0(in.dir,"/",statistics,"_signal_",type.data,"_",mouse,".txt"))
table.signal.entropy<-data.table(stat$V1)
names(table.signal.entropy)<-"entropy"

if(statistics=='nEntropy'){
  x.lab="Naive Entropy"
}else{
  x.lab="Differential Entropy"
}

#(2)
p<-ggplot(table.signal.entropy, aes(x=abs(entropy))) +
  geom_bar(bins=30,col="red", fill="yellow", alpha = .2,stat = "bin",aes(y = 100*(..count..)/sum(..count..))) +
  theme_minimal(base_size = 40) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  labs(title="", x=x.lab, y=" ")
if(statistics=='nEntropy'){
  if (type.data=="clean_signal"){
    ggsave(path = out.dir, filename = "fig11k.png",dpi=300)
  }else{
    ggsave(path = out.dir, filename = "figS8k.png",dpi=300)
  }
}else{
  if (type.data=="clean_signal"){
    ggsave(path = out.dir, filename = "fig11l.png",dpi=300)
  }else{
    ggsave(path = out.dir, filename = "figS8l.png",dpi=300)
  }
}

#(3)
max.x<-3.5 # change this with the value on readme
min.x<-0.5 # change this with the value on readme
p<-ggplot(table.signal.entropy, aes(x=entropy)) +
  geom_bar(bins=30,col="red", fill="yellow", alpha = .2,stat = "bin",aes(y = 100*(..count..)/sum(..count..))) +
  theme_minimal(base_size = 40) +
  scale_x_continuous(limits = c(min.x, max.x)) +
  labs(title="", x=x.lab, y=" ")
if(statistics=='nEntropy'){
  if (type.data=="clean_signal"){
    ggsave(path = out.dir, filename = "fig11e.png",dpi=300)
  }else{
    ggsave(path = out.dir, filename = "figS8e.png",dpi=300)
  }
}else{
  if (type.data=="clean_signal"){
    ggsave(path = out.dir, filename = "fig11f.png",dpi=300)
  }else{
    ggsave(path = out.dir, filename = "figS8f.png",dpi=300)
  }
}

