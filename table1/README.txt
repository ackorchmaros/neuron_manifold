############################################################################################################### TABLE 1 ################################
# author:Annachiara Korchmaros
# goal : fill up table 1
##################################################### MICE repeat 1
# Dip-test linear and Montecarlo linear and Montecarlo
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold-main/data' '1'

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold-main/data' '10' '1'

#HDBSCAN
cd ~/Desktop/neuron_manifold-main/table1
python3 HDBSCAN.py -i '~/Desktop/neuron_manifold-main/data/repeat1_clean_signal_M170714_MP032_2017-08-07.mat -c 2 -s 1 


##################################################### MICE repeat 2
# Dip-test linear and Montecarlo linear and Montecarlo
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold-main/data' '2'

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold-main/data' '10' '2'

#HDBSCAN
cd ~/Desktop/neuron_manifold-main/table1
python3 HDBSCAN.py -i '~/Desktop/neuron_manifold-main/data/repeat2_clean_signal_M170714_MP032_2017-08-07.mat -c 2 -s 1 


####################################################### SEGRE bimodal
#  Create dataset if fig5 was not already created
#Rscript --vanilla ~/Desktop/neuron_manifold-main/fig5/sample_segre_10k_uniform_2clusters.R 100 3000 10 60 160 210 0.3 '~/Desktop/neuron_manifold-main/data' 

# Dip-test linear and Montecarlo linear and Montecarlo
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R '10000ambient_3000sample_199segre_2clusterUniformSample' 'NULL' '~/Desktop/neuron_manifold-main/data' 0

# Hopkins
script --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R '10000ambient_3000sample_199segre_2clusterUniformSample' 'NULL' '~/Desktop/neuron_manifold-main/data' '10' '0'

#HDBSCAN
cd ~/Desktop/neuron_manifold-main/table1
python3 HDBSCAN.py -i ~/Desktop/neuron_manifold-main/data/10000ambient_3000sample_199segre_2clusterUniformSample.mat -c 2 -s 1 


####################################################### UNIMODAL SYNTETIC DATASET
######## dimension = 2
# Create dataset structure
 Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/make_syntetic_data_unimodal.R 2 3000 0 1 '~/Desktop/neuron_manifold-main/table1/data'

##### constant embedding
# Embed data
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/embedding_constant.R 4 0 '~/Desktop/neuron_manifold-main/table1/data' '2ambient_3000sample_unimodal'


#Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/embedding_constant.R '2ambient_3000sample_unimodal_embedded_const' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' 0

# Dip-test linear and Montecarlo
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R '2ambient_3000sample_unimodal_embedded_const' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' 0

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R '2ambient_3000sample_unimodal_embedded_const' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' '10' '0'

#HDBSCAN
python ~/Desktop/neuron_manifold-main/table1/HDBSCAN.py -i ~/Desktop/neuron_manifold-main/table1/data/2ambient_3000sample_unimodal_embedded_const.mat -c 3 

##### embedding with a 0-1 random matrix
#Embed data
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/embedding_randMatrix_same_dim.R 4  '~/Desktop/neuron_manifold-main/table1/data' '2ambient_3000sample_unimodal'

# Dip-test linear and Montecarlo
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R '2ambient_3000sample_unimodal_embedded_randMatrix' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' 0

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R '2ambient_3000sample_unimodal_embedded_randMatrix' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' '10' '0'

#HDBSCAN
python ~/Desktop/neuron_manifold-main/table1/HDBSCAN.py -i ~/Desktop/neuron_manifold-main/table1/data/2ambient_3000sample_unimodal_embedded_randMatrix.mat -c 4 

######## dimension = 50 
# Create dataset structure
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/make_syntetic_data_unimodal.R 50 3000 0 1 ''

##### constant embedding
#Embed data
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/embedding_constant.R 10000 0 '~/Desktop/neuron_manifold-main/table1/data' '50ambient_3000sample_unimodal'

# Dip-test linear and Montecarlo
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R '50ambient_3000sample_unimodal_embedded_const' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' 0

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R '50ambient_3000sample_unimodal_embedded_const' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' '10' '0'

#HDBSCAN
cd ~/Desktop/neuron_manifold-main/table1
python ~/Desktop/neuron_manifold-main/table1/HDBSCAN.py -i ~/Desktop/neuron_manifold-main/table1/data/50ambient_3000sample_unimodal_embedded_const.mat -c 2  

##### embedding with a 0-1 random matrix
#Embed data
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/embedding_randMatrix_same_dim.R 10000  '~/Desktop/neuron_manifold-main/table1/data' '50ambient_3000sample_unimodal'

# Dip-test linear and Montecarlo
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R '50ambient_3000sample_unimodal_embedded_randMatrix' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' 0

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R '50ambient_3000sample_unimodal_embedded_randMatrix' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' '10' '0'

#HDBSCAN
python ~/Desktop/neuron_manifold-main/table1/HDBSCAN.py -i ~/Desktop/neuron_manifold-main/table1/data/50ambient_3000sample_unimodal_embedded_randMatrix.mat -c 2 

####### dimension = 100
# Create dataset structure
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/make_syntetic_data_unimodal.R 100 3000 0 1 '~/Desktop/neuron_manifold-main/table1/data'

# Embed data
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/embedding_constant.R 10000 0 '~/Desktop/neuron_manifold-main/table1/data' '100ambient_3000sample_unimodal'

# Dip-test linear and Montecarlo
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R '100ambient_3000sample_unimodal_embedded_const' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' 0

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R '100ambient_3000sample_unimodal_embedded_const' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' '10' '0'

#HDBSCAN
python ~/Desktop/neuron_manifold-main/table1/HDBSCAN.py -i ~/Desktop/neuron_manifold-main/table1/data/100ambient_3000sample_unimodal_embedded_const.mat -c 2 

##### embedding with a 0-1 random matrix
#Embed data
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/embedding_randMatrix_same_dim.R 10000  '~/Desktop/neuron_manifold-main/table1/data' '100ambient_3000sample_unimodal'

# Dip-test linear and Montecarlo
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R '100ambient_3000sample_unimodal_embedded_randMatrix' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' 0

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R '100ambient_3000sample_unimodal_embedded_randMatrix' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' '10' '0'

#HDBSCAN
python ~/Desktop/neuron_manifold-main/table1/HDBSCAN.py -i ~/Desktop/neuron_manifold-main/table1/data/100ambient_3000sample_unimodal_embedded_randMatrix.mat -c 2 -s 1 

######## dimension = 500
# Create dataset structure
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/make_syntetic_data_unimodal.R 500 3000 0 1 '~/Desktop/neuron_manifold-main/table1/data'

# Embed data
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/embedding_constant.R 10000 0 '~/Desktop/neuron_manifold-main/table1/data' '500ambient_3000sample_unimodal'

# Dip-test linear and Montecarlo
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R '500ambient_3000sample_unimodal_embedded_const' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' 0

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R '500ambient_3000sample_unimodal_embedded_const' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' '10' '0'

#HDBSCAN
python ~/Desktop/neuron_manifold-main/table1/HDBSCAN.py -i ~/Desktop/neuron_manifold-main/table1/data/500ambient_3000sample_unimodal_embedded_const.mat -c 2

##### embedding with a 0-1 random matrix
#Embed data
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/embedding_randMatrix_same_dim.R 10000  '~/Desktop/neuron_manifold-main/table1/data' '500ambient_3000sample_unimodal'

# Dip-test linear and Montecarlo
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R '500ambient_3000sample_unimodal_embedded_randMatrix' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' 0

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R '500ambient_3000sample_unimodal_embedded_randMatrix' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' '10' '0'

#HDBSCAN
python ~/Desktop/neuron_manifold-main/table1/HDBSCAN.py -i ~/Desktop/neuron_manifold-main/table1/data/500ambient_3000sample_unimodal_embedded_randMatrix.mat -c 2 


################################################################### BIMODAL SYNTETIC DATASET

####### dimension of cluster 1= 100, dimension of cluster 2= 100
# Make data structure
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/make_syntetic_data_bimodal.R 100 100 3000 0 5 1 0.3 '~/Desktop/neuron_manifold-main/table1/data'

# Embedding with constant values
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/embedding_constant_dif_dim.R 10000 0 '~/Desktop/neuron_manifold-main/table1/data' '100ambientCluster1_100ambientCluster2_3000sample_bimodal'

# Dip-test linear and Montecarlo R
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R '100ambientCluster1_100ambientCluster2_3000sample_bimodal_embedded_const' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' 0

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R '100ambientCluster1_100ambientCluster2_3000sample_bimodal_embedded_const' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' '40' '0'

#HDBSCAN
python ~/Desktop/neuron_manifold-main/table1/HDBSCAN.py -i ~/Desktop/neuron_manifold-main/table1/data/100ambientCluster1_100ambientCluster2_3000sample_bimodal_embedded_const.mat -c 2 

################## Embedding with random matrix
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/embedding_randMatrix_dif_dim.R 10000  '~/Desktop/neuron_manifold-main/table1/data' '100ambientCluster1_100ambientCluster2_3000sample_bimodal'

# Dip-test linear and Montecarlo 
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R '100ambientCluster1_100ambientCluster2_3000sample_bimodal_embedded_randMatrix' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' 0

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R '100ambientCluster1_100ambientCluster2_3000sample_bimodal_embedded_randMatrix' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' '40' '0'

#HDBSCAN
python ~/Desktop/neuron_manifold-main/table1/HDBSCAN.py -i ~/Desktop/neuron_manifold-main/table1/data/100ambientCluster1_100ambientCluster2_3000sample_bimodal_embedded_randMatrix.mat -c 2  

######## dimension of cluster 1= 100, dimension of cluster 2= 500
# Make data
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/make_syntetic_data_bimodal.R 100 500 3000 0 5 1 0.3 '~/Desktop/neuron_manifold-main/table1/data'

################## Embedding with constant values
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/embedding_constant_dif_dim.R 10000 0 '~/Desktop/neuron_manifold-main/table1/data' '100ambientCluster1_sample_bimodal' '500ambientCluster2_sample_bimodal'

# Dip-test linear and Montecarlo 
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R '100ambientCluster1_500ambientCluster2_sample_bimodal_embedded_const' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' 0

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R '100ambientCluster1_500ambientCluster2_sample_bimodal_embedded_const' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' '40' '0'

#HDBSCAN
python ~/Desktop/neuron_manifold-main/table1/HDBSCAN.py -i ~/Desktop/neuron_manifold-main/table1/data/100ambientCluster1_500ambientCluster2_sample_bimodal_embedded_const.mat -c 2 

################## Embedding with random matrix
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/embedding_randMatrix_dif_dim.R 10000  '~/Desktop/neuron_manifold-main/table1/data' "100ambientCluster1_sample_bimodal" "500ambientCluster2_sample_bimodal"

# Dip-test linear and Montecarlo 
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/dip_test.R '100ambientCluster1_500ambientCluster2_sample_bimodal_embedded_randMatrix' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' 0

# Hopkins
Rscript --vanilla ~/Desktop/neuron_manifold-main/table1/hopkins.R '100ambientCluster1_500ambientCluster2_sample_bimodal_embedded_randMatrix' 'NULL' '~/Desktop/neuron_manifold-main/table1/data' '40' '0'

#HDBSCAN
python ~/Desktop/neuron_manifold-main/table1/HDBSCAN.py -i ~/Desktop/neuron_manifold-main/table1/data/100ambientCluster1_500ambientCluster2_sample_bimodal_embedded_randMatrix.mat -c 2 



