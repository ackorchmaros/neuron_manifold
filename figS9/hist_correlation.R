#----------------------- Histogram of neuronal correlation 
## author: Annachiara Korchmaros
## comments: 
# (1) load 1 repeat from MICE dataset (fully or 1st step preprocessed)
# (2) select 300 neurons randomly
# (3) correlation matrix
# (4) save 
# (5) plot hist with log scale x-axis 
# (6) plot hist in linear scale zoom in by cutting it at the 10%-90%
#############
## libraries 
##############
library(base)
library(ggplot2)  
library(data.table)
library(R.matlab) 
library(HiClimR) #fastCor
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
dir.create(out.dir.file, showWarnings = FALSE)
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
index.sub.data<-sample.int(dim(data.stim.repeat)[2], 300)
sub.data<-data.stim.repeat[,index.sub.data]

#(3)
cor.sub.data<-fastCor(sub.data, upperTri = TRUE)
vec.cor.sub.data<-cor.sub.data[lower.tri(cor.sub.data)]
table.cor.sub.data<-data.table("correlations"=vec.cor.sub.data)

#(4)
save(table.cor.sub.data, file=paste0(out.dir.file,"/cor_signal_300neuron_",type.data,"_",mouse,".RData"))

#(5)
p<-ggplot(table.cor.sub.data, aes(x=abs(correlations))) +
  geom_bar(bins=30,col="red", fill="yellow", alpha = .2,stat = "bin",aes(y = 100*(..count..)/sum(..count..))) +
  theme_minimal(base_size = 18) +
  scale_x_log10(breaks = trans_breaks("log10", function(x) 10^x),
                labels = trans_format("log10", math_format(10^.x))) +
  labs(title="", x="Neuronal Signal Correlation", y="Number of Neurones %")
if (type.data=="clean_signal"){
  ggsave(path = out.dir, filename = "figS9c.png",dpi=300)
}else{
  ggsave(path = out.dir, filename = "figS9d.png",dpi=300)
}

#(6)
min.x<- -0.2 # change this with the value on readme
max.x<-0.2 # change this with the value on readme
p<-ggplot(table.cor.sub.data, aes(x=correlations)) +
  geom_bar(bins=30,col="red", fill="yellow", alpha = .2,stat = "bin",aes(y = 100*(..count..)/sum(..count..))) +
  theme_minimal(base_size = 18) +
  scale_x_continuous(limits = c(min.x, max.x)) +
  labs(title="", x="Neuronal Signal Correlation", y="Number of Neurones %")
if (type.data=="clean_signal"){
  ggsave(path = out.dir, filename = "figS9a.png",dpi=300)
}else{
  ggsave(path = out.dir, filename = "figS9b.png",dpi=300)
}




