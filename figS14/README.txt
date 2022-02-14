#################################################### Correlation ID estimations ################################
# author:Annachiara Korchmaros

########################################################################### MICE repeat 1
# compute euclidean distances
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/euclidean_distance.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/dimensionality/neuron_manifold-main/data' '1' ' ~/Desktop/neuron_manifold-main/figS14/temp' 

# save it as txt
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/convert_mat2txt.R 'repeat1_clean_signal_M170714_MP032_2017-08-07' ' ~/Desktop/neuron_manifold-main/figS14/temp' 

############################ k=750
# compute geodesic distances
python3.9 ~/Desktop/neuron_manifold-main/figS14/compute_geod_dist.py ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_euclidean.txt -n -1 -k 750 >  ~/Desktop/neuron_manifold-main/figS14/log/repeat1_k750.txt

# compute dimension
###(1) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation1.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_euclideanK750_geod_dist.dat --sz 2800 --o  ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_K750_correlation_estimation1

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_K750_correlation_estimation1.npy '1'

###(2) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation2.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_euclideanK750_geod_dist.dat --sz 2800 --o  ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_K750_correlation_estimation2

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_K750_correlation_estimation2.npy '2'

############################ k=1500
# compute geodesic distances
python3.9 ~/Desktop/neuron_manifold-main/figS14/compute_geod_dist.py ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_euclidean.txt -n -1 -k 1500 >  ~/Desktop/neuron_manifold-main/figS14/log/repeat1_k1500.txt

# compute dimension
###(1) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation1.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_euclideanK1500_geod_dist.dat --sz 2800 --o  ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_K1500_correlation_estimation1

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_K1500_correlation_estimation1.npy '1'

###(2) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation2.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_euclideanK1500_geod_dist.dat --sz 2800 --o  ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_K1500_correlation_estimation2

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_K1500_correlation_estimation2.npy '2'


############################ k=2799
# compute geodesic distances
python3.9 ~/Desktop/neuron_manifold-main/figS14/compute_geod_dist.py ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_euclidean.txt -n -1 -k 2799 >  ~/Desktop/neuron_manifold-main/figS14/log/repeat1_k2799.txt

# compute dimension
###(1) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation1.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_euclideanK2799_geod_dist.dat --sz 2800 --o  ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_K2799_correlation_estimation1

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_K2799_correlation_estimation1.npy '1'

###(2) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation2.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_euclideanK2799_geod_dist.dat --sz 2800 --o  ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_K2799_correlation_estimation2

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/repeat1_K2799_correlation_estimation2.npy '2'
########################################################################### MICE repeat 2
# compute euclidean distances
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/euclidean_distance.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/dimensionality/neuron_manifold-main/data' '2' ' ~/Desktop/neuron_manifold-main/figS14/temp' 

# save it as txt
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/convert_mat2txt.R 'repeat2_clean_signal_M170714_MP032_2017-08-07' ' ~/Desktop/neuron_manifold-main/figS14/temp' 

############################ k=750
# compute geodesic distances
python3.9 ~/Desktop/neuron_manifold-main/figS14/compute_geod_dist.py ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_euclidean.txt -n -1 -k 750 >  ~/Desktop/neuron_manifold-main/figS14/log/repeat2_k750.txt

# compute dimension
###(1) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation1.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_euclideanK750_geod_dist.dat --sz 2800 --o  ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_K750_correlation_estimation1

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_K750_correlation_estimation1.npy '1'

###(2) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation2.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_euclideanK750_geod_dist.dat --sz 2800 --o  ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_K750_correlation_estimation2

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_K750_correlation_estimation2.npy '2'

############################ k=1500
# compute geodesic distances
python3.9 ~/Desktop/neuron_manifold-main/figS14/compute_geod_dist.py ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_euclidean.txt -n -1 -k 1500 >  ~/Desktop/neuron_manifold-main/figS14/log/repeat2_k1500.txt

# compute dimension
###(1) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation1.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_euclideanK1500_geod_dist.dat --sz 2800 --o  ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_K1500_correlation_estimation1

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_K1500_correlation_estimation1.npy '1'

###(2) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation2.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_euclideanK1500_geod_dist.dat --sz 2800 --o  ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_K1500_correlation_estimation2

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_K1500_correlation_estimation2.npy '2'


############################ k=2799
# compute geodesic distances
python3.9 ~/Desktop/neuron_manifold-main/figS14/compute_geod_dist.py ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_euclidean.txt -n -1 -k 2799 >  ~/Desktop/neuron_manifold-main/figS14/log/repeat2_k2799.txt

# compute dimension
###(1) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation1.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_euclideanK2799_geod_dist.dat --sz 2800 --o  ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_K2799_correlation_estimation1

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_K2799_correlation_estimation1.npy '1'

###(2) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation2.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_euclideanK2799_geod_dist.dat --sz 2800 --o  ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_K2799_correlation_estimation2

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/repeat2_K2799_correlation_estimation2.npy '2'

########################################################################### segre
# compute euclidean distances
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/euclidean_distance.R '10000ambient_3000sample_199segre_normalSample' "NULL" '~/Desktop/dimensionality/neuron_manifold-main/linearity/data' '0' ' ~/Desktop/neuron_manifold-main/figS14/temp' 

# save it as txt
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/convert_mat2txt.R '10000ambient_3000sample_199segre_normalSample' ' ~/Desktop/neuron_manifold-main/figS14/temp' 

############################ k=750
# compute geodesic distances
python3.9 ~/Desktop/neuron_manifold-main/figS14/compute_geod_dist.py ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_euclidean.txt -n -1 -k 750 >  ~/Desktop/neuron_manifold-main/figS14/log/10000ambient_3000sample_199segre_normalSample_k750.txt

# compute dimension
###(1) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation1.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_euclideanK750_geod_dist.dat --sz 3000 --o  ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_K750_correlation_estimation1

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_K750_correlation_estimation1.npy '1'

###(2) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation2.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_euclideanK750_geod_dist.dat --sz 3000 --o  ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_K750_correlation_estimation2

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_K750_correlation_estimation2.npy '2'

############################ k=1500
python3.9 ~/Desktop/neuron_manifold-main/figS14/compute_geod_dist.py ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_euclidean.txt -n -1 -k 1500 >  ~/Desktop/neuron_manifold-main/figS14/log/10000ambient_3000sample_199segre_normalSample_k1500.txt

# compute dimension
###(1) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation1.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_euclideanK1500_geod_dist.dat --sz 3000 --o  ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_K1500_correlation_estimation1

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_K1500_correlation_estimation1.npy '1'

###(2) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation2.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_euclideanK1500_geod_dist.dat --sz 3000 --o  ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_K1500_correlation_estimation2

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_K1500_correlation_estimation2.npy '2'

############################ k=2799
python3.9 ~/Desktop/neuron_manifold-main/figS14/compute_geod_dist.py ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_euclidean.txt -n -1 -k 2999 >  ~/Desktop/neuron_manifold-main/figS14/log/10000ambient_3000sample_199segre_normalSample_k2999.txt

# compute dimension
###(1) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation1.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_euclideanK2999_geod_dist.dat --sz 3000 --o  ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_K2999_correlation_estimation1

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_K2999_correlation_estimation1.npy '1'

###(2) estimation
python3.9  ~/Desktop/neuron_manifold-main/figS14/correlation_dimension_estimation2.py --i  ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_euclideanK2999_geod_dist.dat --sz 3000 --o  ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_K2999_correlation_estimation2

# plot
Rscript --vanilla  ~/Desktop/neuron_manifold-main/figS14/correlation_diagram.R ~/Desktop/neuron_manifold-main/figS14/temp/10000ambient_3000sample_199segre_normalSample_K2999_correlation_estimation2.npy '2'





