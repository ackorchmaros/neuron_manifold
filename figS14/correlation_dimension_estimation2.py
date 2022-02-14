# Correlation dimension estimation with geodesic distance and Granata estimation

# author:Annachiara Korchmaros
# method: equation(2) from "Accurate Estimation of the Intrinsic Dimension Using Graph Distances: Unraveling the Geometric Complexity of Datasets"

from __future__ import print_function, division
import numpy as np
import time
import os
import copy
import pickle
import argparse
from tqdm import tqdm
import pathlib
import math
import sys
import os
from os.path import join
#(1) args
parser = argparse.ArgumentParser(description='Dataset Experiment')
parser.add_argument('--i', default=0, type=str, metavar='',
                  help='give the path/input_name, ie. geodesic distances')
parser.add_argument('--sz', default=0, type=int, metavar='',
                  help='give the sample size') 
parser.add_argument('--o', default=0, type=str, metavar='',
                  help='give the path/output_name, ie. array of D(r)')   
parser.add_argument('--ch', default=25, type=int, metavar='',
                  help='give the number of checks for x-axis of D(r)')                   
              
args = parser.parse_args() 
fin= args.i 
fout=args.o 
sample_size=args.sz
checks=args.ch

#(2) define paths
parts = fin.split('/')
sample=parts[len(parts)-1]
in_dir=fin.split(join('/',sample))[0]
sys.path.insert(0, in_dir) # add to python path of search

parts = fout.split('/')
sample=parts[len(parts)-1]
out_dir=fout.split(join('/',sample))[0]
sys.path.insert(0, out_dir) # add to python path of search

#(3) load and sort data
data_all = np.loadtxt(fin)
data= data_all.tolist()
data.sort()
# (4) pass to scaled distances
data_a=np.array(data)
data=data_a/max(data_a)
n_dist=len(data)
#(5) compute C
def C(r,data_t):
	# Heaviside function on r<max of distances
	S_list=[0]*n_dist
	idx_large_array=np.where(data_t >= r)
	idx_large=idx_large_array[0][0]# 1st r <= data:
	S_list[0:idx_large]=[1]*idx_large
	# cumulative distribution
	S_list_sum=sum(S_list)
	C=(2*S_list_sum)/((sample_size)*(sample_size-1))
	if C > 0:
		return math.log(C)
	else:
		return 0 # case  r< min of distances 

print('Computing dimension')

increment=(1-0.1)/checks
r_range=np.arange(0.1,1,increment) 
r_range_list=r_range.tolist()
D=[C(i,data)/math.log(i) for i in r_range_list[0:len(r_range_list)] ]
# save D
d=[]
d.append(D)
np.save(fout,d)














































