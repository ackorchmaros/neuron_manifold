# Compute geodesic distance

# source: Daniele Granata, Vincenzo Carnevale  
#  "Accurate estimation of intrinsic dimension using graph distances: unraveling the geometric complexity of datasets" 
#  Scientific Report, 6, 31377 (2016)
#  https://www.nature.com/articles/srep31377
import sys,argparse
import numpy as n
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
from scipy.sparse import csr_matrix
from scipy.spatial import distance
from sklearn.neighbors import kneighbors_graph, radius_neighbors_graph
from sklearn.utils.graph import graph_shortest_path

def func(x,a,b,c):
    return a*n.log(n.sin(x/1*n.pi/2.))
         
def func2(x,a):
    return -a/2.*(x-1)**2

def func3(x,a,b,c):
    return n.exp(c)*n.sin(x/b*n.pi/2.)**a

def main(argv):
     
     parser = argparse.ArgumentParser(epilog="NOTE: it is important to have a smooth histogram for accurate fitting\n\n")
     parser.add_argument("filename", help="input filename")
     
     parser.add_argument("-m", "--metric" , type=str,  help="define the scipy distance to be used   (Default: euclidean or hamming for MSA)",default='euclidean')
     parser.add_argument("-x", "--matrix", help="if the input file contains already the complete upper triangle of a distance matrix (2 Formats: (idx_i idx_j distance) or simply distances list ) (Opt)", action="store_true")
     parser.add_argument("-k", "--n_neighbors", type=int, help="nearest_neighbors parameter (Default k=3)", default=3)
     parser.add_argument("-r", "--radius", type=float, help="use neighbor radius instead of nearest_neighbors  (Opt)",default=0.)
     parser.add_argument("-b", "--n_bins", type=int, help="number of bins for distance histogram (Default 50)",default=50)
     parser.add_argument("-M", "--r_max", type=float, help="fix the value of distance distribution maximum in the fit (Opt, -1 force the standard fit, avoiding consistency checks)",default=0)
     parser.add_argument("-n", "--r_min", type=float, help="fix the value of shortest distance considered in the fit (Opt, -1 force the standard fit, avoiding consistency checks)",default=-10)
     parser.add_argument("-D", "--direct", help="analyze the direct (not graph) distances (Opt)", action="store_true")
     parser.add_argument("-I", "--projection", help="produce an Isomap projection using the first ID components (Opt)", action="store_true")
     
     args = parser.parse_args()
     input_f = args.filename
     me=args.metric
     n_neighbors = args.n_neighbors
     radius=args.radius+0
     MSA=False
     n_bins = args.n_bins
     rmax=args.r_max
     mm=-10000

     print('\nFile name: ', input_f)
     
     #0 Reading input file
     f1 = open(input_f)
     data = []
     data_line = []
     labels = []

     for line in f1:
         if line[0]==">" : 
               MSA=True
               labels.append(line)
         if line[0]!=">" and MSA==True : 
               data.append([ord(x) for x in line[:-1]])
               data_line.append(line)
         elif line[0]!="#" and MSA==False : 
               data.append([float(x) for x in line.split()])
               data_line.append(line) 
     f1.close()

     data = n.asarray(data)
     if MSA : me='hamming'
     if args.matrix : me='as from the input file'
     print('Metric: ', me)
     if radius>0. and (args.direct==False) : print ('Nearest Neighbors Radius:', radius)
     elif (args.direct==False): print ('Nearest Neighbors number K: ', n_neighbors)
     else : print('Distance distribution are calculated based on the  direct input-space distances ')
     
     if radius>0. :  
        filename = str(input_f.split('.')[0])+'R'+str(radius)
     else  :
        filename = str(input_f.split('.')[0])+'K'+str(n_neighbors)
     #0
     
     #1 Computing geodesic distance on connected points of the input file and relative histogram
     print ('\nComputing geodesic distance on connected points of the input file and relative histogram\n')  
     if args.matrix :
        if data.shape[1] == 1 :
           dist_mat=distance.squareform(data.ravel())
           mm=dist_mat.shape[1]
        elif data.shape[1] == 3 : 
           mm=int(max(data[:,1]))
           dist_mat=n.zeros((mm,mm))
           for i in range(0,data.shape[0]):
               dist_mat[int(data[i,0])-1,int(data[i,1])-1]=data[i,2]
               dist_mat[int(data[i,1])-1,int(data[i,0])-1]=data[i,2]
        else : print('ERROR: The distances input is not in the right matrix format') ; sys.exit(2)

        print("\n# points: ", mm)

        A=n.zeros((mm,mm))
        rrr=[]
           
        if radius > 0. :
           for i in range(0,mm):
               ll=dist_mat[i] < radius
               A[i,ll]=dist_mat[i,ll]
        else :
           rrr=n.argsort(dist_mat)
           for i in range(0,mm):
               ll=rrr[i,0:n_neighbors+1]
               A[i,ll]=dist_mat[i,ll]
           radius = A.max()

        if args.direct : C=dist_mat
        else : C= graph_shortest_path(A,directed=False)
        
     else : 
        print("\n# points, coordinates: ", data.shape)
        if args.direct : C=distance.squareform(distance.pdist(data,me));
        elif radius>0. :
           A = radius_neighbors_graph(data, radius,metric=me,mode='distance')
           C= graph_shortest_path(A,directed=False)
        else  : # this is used to make the graph distances
           A = kneighbors_graph(data, n_neighbors,metric=me,mode='distance')
           C= graph_shortest_path(A,directed=False)
           radius=A.max()

     C=n.asmatrix(C)
     connect=n.zeros(C.shape[0])
     conn=n.zeros(C.shape[0])
     for i in range(0,C.shape[0]) :
         conn_points=n.count_nonzero(C[i])
         conn[i]=conn_points
         if conn_points > C.shape[0]/2. : connect[i]=1
         else : C[i]=0

     if n.count_nonzero(connect) > C.shape[0]/2. :
        print('Number of connected points:', n.count_nonzero(connect), '(',100*n.count_nonzero(connect)/C.shape[0],'% )')
     else : print('The neighbors graph is highly disconnected, increase K or Radius parameters') ; sys.exit(2)

     if n.count_nonzero(connect) < data.shape[0] :
        data_connect_file = open('{0}_connected_data.dat'.format(filename), "w")
        for i in range(0,C.shape[0]) :
            if connect[i]==1 :
               if MSA : data_connect_file.write(labels[i])
               data_connect_file.write(data_line[i])
        data_connect_file.close()

     
     indices = n.nonzero(n.triu(C,1))
     dist_list = n.asarray( C[indices] )[-1]
     
     dist_file= open('{0}_geod_dist.dat'.format(filename), "w")

     for i in range(0, len(dist_list)):
         dist_file.write("%s " % ((dist_list[i])))
     dist_file.close()

     h=n.histogram(dist_list,n_bins)
     dx=h[1][1]-h[1][0]


     plt.figure(1)
     plt.plot(h[1][0:n_bins]+dx/2,h[0],'o-',label='histogram')
     plt.xlabel('r')
     plt.ylabel('N. counts')
     plt.legend()
     plt.savefig(filename+'_hist.png')
     distr_x = []
     distr_y = []

     print ('Done\n')

if __name__ == "__main__":
     main(sys.argv[1:])
