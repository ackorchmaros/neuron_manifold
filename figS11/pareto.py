# Compute ID with pareto method
# author: Annachiara Korchmaros
# source: ["Intrinsic dimension of data representations in deep neural networks"](https://arxiv.org/abs/1905.12784)
# comments: the output is saved as .pyn file which needs to be plotted
from __future__ import print_function, division
import torch
import torch.nn as nn
import torch.optim as optim
from torch.optim import lr_scheduler
from torch.autograd import Variable
import numpy as np
import torchvision
from torchvision import datasets, models, transforms
import matplotlib.pyplot as plt
import time
import os
import copy
import pickle
import argparse
from tqdm import tqdm
import pathlib
from intrinsic_dimension_func import estimate, block_analysis 

# call some funtions 
from scipy.spatial.distance import pdist,squareform

# args
parser = argparse.ArgumentParser(description='Dataset Experiment')

parser.add_argument('--nres', default=20, type=int, metavar='N',
                    help='number of resamplings')

parser.add_argument('--i', default=0, type=str, metavar='',
                  help='give the path to the Euclidean matrix')
parser.add_argument('--o', default=0, type=str, metavar='',
                  help='give the path to output')                    
args = parser.parse_args()
nres = args.nres
fname= args.i 
fout= args.o
 
# define python path of search and input folder
import os
from os.path import join
import sys

path = pathlib.Path(fname)
data_folder= path.parent
path = pathlib.Path(data_folder)
analysis_folder= path.parent

sys.path.insert(0,analysis_folder )
sys.path.insert(0, data_folder)

#load euclidean distances matrix
from scipy.io import loadmat
data = loadmat(fname)
dist=data['x'] 
dataloader = torch.utils.data.DataLoader(data, batch_size=nres, shuffle=True, num_workers=1) # divide the data in $nres batches and shuffle them, use only 1 processor

# compute ID with block analysis
method = 'euclidean'
BA=[]
ba = block_analysis(dist)         
BA.append(ba)
np.save(fout,BA)
print('Done.')













