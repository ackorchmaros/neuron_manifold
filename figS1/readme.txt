################################ FIG S1 ################################
# author:Annachiara Korchmaros
# goal: Test how the eigenvalues change accordingly to sample size and sampling method for samples from orthogonal group

# normal sampling
# 300 
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS1/sample_og_10k_normal.R 400 300 100 27 '~/Desktop/neuron_manifold-main/data' 

# uniform 1 cluster
# 300 
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS1/sample_og_10k_uniform_1cluster.R 400 300 10 210 '~/Desktop/neuron_manifold-main/data' 

# uniform 2 clusters
# 300 
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS1/sample_og_10k_uniform_2clusters.R 400 300 10 60 160 210 0.3 '~/Desktop/neuron_manifold-main/data' 

# make plots
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold-main/figS1/process_data_PCA_og.m');exit;" | tail -n +11
