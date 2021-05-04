################################ Compute Differential Entropy of neuronal signal ################################
# author:Annachiara Korchmaros
# source: https://github.com/gregversteeg/NPEET

from npeet import entropy_estimators as ee
from math import log, pi
import numpy as np
import numpy.random as nr
import sys,argparse
import scipy.io
import random


print("\n\n Computing differential entropy.. \n")
def main(argv):

	parser = argparse.ArgumentParser(epilog="NOTE: it is important to have a smooth histogram for accurate fitting\n\n")
	parser.add_argument("-i","--input", type=str,  help="input file")
	parser.add_argument("-o","--output", type=str,  help="output file")

	args = parser.parse_args()
	input_f = args.input     
	output_f = args.output

	#(1) load matrix of data
	data_all = scipy.io.loadmat(input_f)
	data_matrix=data_all['signal'] # images x neurons
	
	#(2) compute entropy
	index_ar = np.arange(start=0, stop=data_matrix.shape[1], step=1)
	dif_entropy=[]
	for i in index_ar: 
		data_neuron=data_matrix[:,i,0]
		list_data_neuron = data_neuron.tolist()
		#print(type(list_data_neuron))
		new_list = []
		# Creating list of list format
		for elem in list_data_neuron:
			elem_st = str(elem)
			temp = elem_st.split(', ')
			temp_float=float(temp[0])
			new_list.append([temp_float])
			
		out=ee.entropy(new_list)
		dif_entropy.append(out)
	
	#(3) save
	with open(output_f, 'w+') as filehandle:
		for listitem in dif_entropy:
		   filehandle.write('%s\n' % listitem)
    
if __name__ == "__main__":
     main(sys.argv[1:])
     

