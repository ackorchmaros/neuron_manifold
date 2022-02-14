#--------------------------------------Plot correlation diagrams 
## Annachiara Korchmaros

## method from "Accurate Estimation of the Intrinsic Dimension Using Graph Distances: Unraveling the Geometric Complexity of Datasets"

## comments: plot ID obtained from ID_curve.py or ID_curve_estimation.py
#(1) load geodesic distances
#(2) plot correlation diagram
##############
## libraries 
##############
library(base)
library(fBasics)
library(ggplot2)
library(data.table)
library(RcppCNPy) # read npy files
##############
## arguments 
##############
args = commandArgs(trailingOnly=TRUE)
f.D<-args[1] 
estimation<-as.numeric(args[2]) 
f.out<-tools::file_path_sans_ext(basename(f.D))
out.dir<-paste0(dirname(dirname(f.D)),"/figs")
dir.create(out.dir, showWarnings = FALSE)
###############
## steps
###############
#(1)
D <- npyLoad(f.D)
#(2)
print("Preparing data to be plotted")
m<-0.1
M<-1
increment<-(M-m)/25
r.range<-seq(m,M,increment)
if (estimation =='2'){
  r.range<-r.range[-length(r.range)]
  
}else{
  r.range<-r.range[-length(r.range)]
  r.range<-r.range[-length(r.range)]
}


data.t<-data.table("r"=r.range, "D"=as.vector(D))
#(3) plot
if (estimation =='1'){
  col="green"
}else if (estimation =='2'){
  col="blue"
} else{
  col="red"
}
print("Making a correlation diagram")
p=ggplot(data.t, aes(x = r, y = D)) +
  geom_line(size=1, colour = col)+
  xlab(expression(epsilon)) +
  ylab(expression(paste("d(",epsilon,")"))) +
  theme_light(base_size = 22) +
  scale_x_continuous(breaks=seq(0,1,0.1)) +
  theme(axis.title.y = element_text(angle = 0,vjust = 0.5))
  
print(p)
ggsave(filename=paste0(f.out,'.jpg'), plot=p, path=out.dir, dpi=300)



