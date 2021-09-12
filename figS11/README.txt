##################################################################################### FIG S11
# author:Annachiara Korchmaros
# goal: compute ID with pareto method

############ Mice dataset first repeat
# compute euclidean distances
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS11/euclidean_distance.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold-main/data' '1' '~/Desktop/neuron_manifold-main/figS11/temp' 

# compute ID estimates 
python ~/Desktop/neuron_manifold-main/figS11/pareto.py --nres 20 --i '~/Desktop/neuron_manifold-main/figS11/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_euclidean.mat' --o '~/Desktop/neuron_manifold-main/figS11/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_BA.npy'

# plot ID estimate
python  ~/Desktop/neuron_manifold-main/figS11/pareto_plot.py --i '~/Desktop/neuron_manifold-main/figS11/temp/BA.npy'  --o '~/Desktop/neuron_manifold-main/figS11/figs/repeat1_clean_signal_M170714_MP032_2017-08-07_pareto.png' --d 1

############ Mice dataset second repeat
# compute euclidean distances
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS11/euclidean_distance.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold-main/data' '2' '~/Desktop/neuron_manifold-main/figS11/temp'

# compute ID estimates 
cd ~/Desktop/neuron_manifold-main/figS11
python ~/Desktop/neuron_manifold-main/figS11/pareto.py --nres 20 --i '~/Desktop/neuron_manifold-main/figS11/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_euclidean.mat' --o '~/Desktop/neuron_manifold-main/figS11/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_BA.npy'

# plot ID estimate
python  ~/Desktop/neuron_manifold-main/figS11/pareto_plot.py --i '~/Desktop/neuron_manifold-main/figS11/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_BA.npy'  --o '~/Desktop/neuron_manifold-main/figS11/figs/repeat2_clean_signal_M170714_MP032_2017-08-07_pareto.eps' --d 2


############ Segre 1 repeat
# make data
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS11/sample_segre_10k_normal.R 100 3000 10 1 '~/Desktop/neuron_manifold-main/figS11/temp' 

# compute euclidean distances
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS11/euclidean_distance.R '10000ambient_3000sample_199segre_normalSample' "NULL" '~/Desktop/IDality/neuron_manifold-main/temp' '0' '~/Desktop/neuron_manifold-main/figS11/temp'

# compute ID estimates 
python  ~/Desktop/neuron_manifold-main/figS11/pareto.py --nres 20 --i '~/Desktop/neuron_manifold-main/figS11/temp/10000ambient_3000sample_199segre_normalSample_euclidean.mat' --o '~/Desktop/neuron_manifold-main/figS11/temp/10000ambient_3000sample_199segre_normalSample_BA.npy'

# plot ID estimate
python  ~/Desktop/neuron_manifold-main/figS11/pareto_plot.py --i '~/Desktop/neuron_manifold-main/figS11/temp/10000ambient_3000sample_199segre_normalSample_BA.npy'  --o '~/Desktop/neuron_manifold-main/figS11/figs/10000ambient_3000sample_199segre_normalSample_pareto.eps' --d 2


