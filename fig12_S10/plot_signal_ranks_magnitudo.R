#----------------------- Plot of signal ranks vs. magnitudo 
## author: Annachiara Korchmaros
## comments: 
# (1) load data
# (2) load statistics which will be used to order the data
# (3) order the statistics in decreasing order 
# (4) plot x-axis 1, .., number of neurons, ie ranks y-axis magnitudo in log-log scale
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
in.dir.stat<-args[4] 
statistics<-args[5] 
# output path
out.dir<-args[6] 
dir.create(out.dir, showWarnings = FALSE)
###############
## steps
###############
#(1)
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
if(statistics!="nEntropy" & statistics!="dEntropy"){
  load(file=paste0(in.dir.stat,"/",statistics,"_signal_",type.data,"_",mouse,".RData")) #load variable stat
  statistics_out=statistics
  if(statistics_out=="Mean"){statistics="Average"}
  
  
}else{
  stat<-read.table(file=paste0(in.dir.stat,"/",statistics,"_signal_",type.data,"_",mouse,".txt"))
  statistics_out=statistics
  if(statistics_out=="nEntropy"){statistics="Naive Entropy"}else{statistics="Differential Entropy"}
  stat<-data.table(stat$V1)
}

#(3)
table.signal.range<-stat
names(table.signal.range)<-"magnitudo"
table.signal.range<-table.signal.range[order(-table.signal.range$magnitudo),]
table.signal.range$ranks<-as.numeric(rownames(table.signal.range))

#(4)
if(statistics_out!="nEntropy" & statistics_out!="dEntropy"){
# log-log scale
  p<-ggplot(table.signal.range, aes(x= ranks)) + 
    geom_line(aes(y=abs(magnitudo), col="red")) + 
    theme_minimal(base_size = 40) +
    scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                  labels = trans_format("log10", math_format(10^.x))) +
    scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),
                  labels = trans_format("log10", math_format(10^.x))) +
    annotation_logticks() +
    theme(legend.position = "none")+
    labs(title="", x="Rank", y=statistics) 
  p<-p+  geom_vline(xintercept =dim(data.stim.repeat)[1] , color = "blue")
  if (type.data=="clean_signal"){
    ggsave(path = out.dir, filename = paste0("fig12_",statistics_out,".png"),dpi=300)
  }else{
    ggsave(path = out.dir, filename = paste0("figS10_",statistics_out,".png"),dpi=300)
  }
}else{
#linear
  p<-ggplot(table.signal.range, aes(x= ranks)) +
    geom_line(aes(y=magnitudo, col="red")) +
    theme_minimal(base_size = 40) +
    theme(legend.position = "none")+
    labs(title="", x="Rank", y=statistics)
  p<-p+  geom_vline(xintercept =dim(data.stim.repeat)[1] , color = "blue")
  if (type.data=="clean_signal"){
    ggsave(path = out.dir, filename = paste0("fig12_",statistics_out,".png"),dpi=300)
  }else{
    ggsave(path = out.dir, filename = paste0("figS10_",statistics_out,".png"),dpi=300)
  }
}
