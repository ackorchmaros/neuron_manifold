################################ FIG S1 ################################
# author:Annachiara Korchmaros
# goal: Test how the eigenvalues change accordingly to sample size and sampling method for samples from orthogonal group

# normal sampling
# 300 
Rscript --vanilla ~/Desktop/neuron_manifold/figS1/sample_og_10k_normal.R 400 300 100 27 '~/Desktop/neuron_manifold/data' 

# uniform 1 cluster
# 300 
Rscript --vanilla ~/Desktop/neuron_manifold/figS1/sample_og_10k_uniform_1cluster.R 400 300 10 210 '~/Desktop/neuron_manifold/data' 

# uniform 2 clusters
# 300 
Rscript --vanilla ~/Desktop/neuron_manifold/figS1/sample_og_10k_uniform_2clusters.R 400 300 10 60 160 210 0.3 '~/Desktop/neuron_manifold/data' 

# make plots
run ~/Desktop/neuron_manifold/figS1/stringer-pachitariu-et-al-2018b-master/process_data_PCA_variety_ak.m
with
sample_size='400ambient_300sample_190og'; 
neuron_manifold/data

/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold/fig5/process_data_PCA_variety.m');exit;" | tail -n +11
