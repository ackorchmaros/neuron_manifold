# Plot dimensionality estimation with pareto method
# author: Annachiara Korchmaros
# source: ["Intrinsic dimension of data representations in deep neural networks"](https://arxiv.org/abs/1905.12784)
# comments: the output is saved as in /figs

import os
from os.path import join
import sys
import pandas as pd
import pickle
from time import time
import torch
import numpy as np
from matplotlib import pyplot as plt
from tqdm import tqdm
import pathlib
import argparse


# args
parser = argparse.ArgumentParser(description='Dataset Experiment')
parser.add_argument('--i', default=0, type=str, metavar='',
                  help='give the path to BA.npy') 
parser.add_argument('--o', default=0, type=str, metavar='',
                  help='give the path to /figs')   
parser.add_argument('--d', default=0, type=int, metavar='',
                  help='intercept of red line, choose it such that there is a plateu')                                    
args = parser.parse_args()
fout = args.o 
finput= args.i 
intercept= args.d 

# add input and output path 
path = pathlib.Path(finput)
analysis_folder= path.parent
os.chdir(analysis_folder) # change current directory to analysis_folder
sys.path.insert(0,analysis_folder )

path = pathlib.Path(fout)
out_folder= path.parent
sys.path.insert(0,out_folder )

# analysis
BA = np.load(finput)
n_points = BA[0][2]

fs = 15
ms = 10
lw = 1
import itertools
sel = [list(range(4)),[5],[9],[15]]
merged = list(itertools.chain.from_iterable(sel))
nps = [n_points[x] for x in merged]
int_nps = [int(i) for i in nps]

# plot
fig = plt.figure(figsize=(10,12))
plt.errorbar(n_points,BA[0][0],
                 yerr=BA[0][1],
                 fmt='-k',
                 linewidth=lw,
                 markersize=ms)
d=BA[0,0][intercept]
d=round(d)
plt.axhline(y = d, color = 'r', linestyle = '-')
h=plt.ylabel('d',fontsize=30)
h.set_rotation(0)
plt.yticks(fontsize=20)
plt.xticks(int_nps, int_nps, rotation=90, fontsize=20)
plt.xlabel('number of data points',fontsize=30)
fig.savefig(fout,format='eps')

print('The dimension estimate with the Pareto method is',d)
print('Done.')













