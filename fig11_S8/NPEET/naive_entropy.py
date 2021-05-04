################################ Compute Naive Entropy of neuronal response ################################
# author:Annachiara Korchmaros
# source: https://github.com/gregversteeg/NPEET

from npeet import entropy_estimators as ee
from math import log, pi
import numpy as np
import numpy.random as nr
import pandas as pd
import sys,argparse


print("\n\n Computing naive entropy.. \n")

print("For a uniform distribution with width alpha, the differential entropy is log_2 alpha, setting alpha = 2")
print("and using k=1, 2, 3, 4, 5")
print("result:", [ee.entropy([[2 * random.random()] for i in range(1000)], k=j + 1) for j in range(5)])

def main(argv):

	parser = argparse.ArgumentParser(epilog="NOTE: it is important to have a smooth histogram for accurate fitting\n\n")
	parser.add_argument("-i","--input", type=str,  help="input file")
	parser.add_argument("-o","--output", type=str,  help="output file")

	args = parser.parse_args()
	input_f = args.input     
	output_f = args.output

	#(1) load matrix of counts
	counts_matrix = pd.read_csv(input_f,sep=';') # 8122 x 800
	np_matrix=counts_matrix.to_numpy() # 8122 x 800
	
	#(2) compute entropy
	index_ar = np.arange(start=0, stop=np_matrix.shape[0], step=1)
	naive_entropy=[]
	for i in index_ar: 
		data_neuron=np_matrix[i,:]
		list_data_neuron = data_neuron.tolist()
		out=ee.entropyd(list_data_neuron)
		naive_entropy.append(out)
	
	#(3) save
	with open(output_f, 'w+') as filehandle:
		for listitem in naive_entropy:
		   filehandle.write('%s\n' % listitem)
    
if __name__ == "__main__":
     main(sys.argv[1:])
     

