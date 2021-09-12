# HDBSCAN
# author:Annachiara Korchmaros
#source:https://nbviewer.jupyter.org/github/scikit-learn-contrib/hdbscan/blob/master/notebooks/How%20HDBSCAN%20Works.ipynb
#comments: min_cluster_size: set it to the smallest size grouping that you wish to consider a cluster.



# libraries
import numpy as np
import matplotlib.pyplot as plt
import sklearn.datasets as data
import time
import scipy.io
import sys,argparse
import seaborn as sns
import hdbscan

print("\n\n Clustering.. \n")
# main function
def main(argv):

	parser = argparse.ArgumentParser(epilog="NOTE: it is important to have a smooth histogram for accurate fitting\n\n")
	parser.add_argument("-i","--input", type=str,  help="input file")
	parser.add_argument("-c","--minclusterSize", type=int,  help=" min_cluster_size: smallest size grouping that you wish to consider a cluster")

	args = parser.parse_args()
	input_f = args.input     
	c = args.minclusterSize

	#(1) load matrix of data
	data_all = scipy.io.loadmat(input_f)
	data_matrix=data_all['x'] # number of samples x number of features
	
	#(2) compute clusters
	clusterer = hdbscan.HDBSCAN(min_cluster_size=c, allow_single_cluster=True)
	cluster_labels = clusterer.fit_predict(data_matrix)
	print('\nCluster labels: ', cluster_labels)
	
	#(3) print number of clusters
	hdb_labels = clusterer.labels_
	n_clusters_hdb_ = len(set(hdb_labels)) - (1 if -1 in hdb_labels else 0)
	print('\nNumber of clusters: ', n_clusters_hdb_)
	
	#(4) biclusters 
	if n_clusters_hdb_ == 2:
		l_cluster_labels=list(cluster_labels)
		cluster1_size = 100*l_cluster_labels.count(0)/len(l_cluster_labels)
		cluster2_size = 100*l_cluster_labels.count(1)/len(l_cluster_labels)
		print (cluster2_size,"% of the samples is in cluster 2")
	else :
		l_cluster_labels=list(cluster_labels)
		cluster1_size = 100*l_cluster_labels.count(-1)/len(l_cluster_labels)
		print (cluster1_size)#print (cluster1_size,"% of the samples is an outlier")
		cluster2_size = 100*l_cluster_labels.count(0)/len(l_cluster_labels)
		print (cluster2_size,"% of the samples is in cluster 1")
		
if __name__ == "__main__":
     main(sys.argv[1:])








































