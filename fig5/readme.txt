################################ FIG 5 ################################
# author:Annachiara Korchmaros
# goal: Test how the eigenvalues change accordingly to sample size and sampling method

# normal sampling
# 300
Rscript --vanilla ~/Desktop/neuron_manifold-main/fig5/sample_segre_10k_normal.R 100 300 100 27 '~/Desktop/neuron_manifold-main/data' 

# 3000
Rscript --vanilla ~/Desktop/neuron_manifold-main/fig5/sample_segre_10k_normal.R 100 3000 100 27 '~/Desktop/neuron_manifold-main/data' 

# 5000
Rscript --vanilla ~/Desktop/neuron_manifold-main/fig5/sample_segre_10k_normal.R 100 5000 100 27 '~/Desktop/neuron_manifold-main/data' 

# uniform 1 cluster
# 300
Rscript --vanilla ~/Desktop/neuron_manifold-main/fig5/sample_segre_10k_uniform_1cluster.R 100 300 10 210 '~/Desktop/neuron_manifold-main/data' 

# 3000
Rscript --vanilla ~/Desktop/neuron_manifold-main/fig5/sample_segre_10k_uniform_1cluster.R 100 3000 10 210 '~/Desktop/neuron_manifold-main/data' 

# 5000
Rscript --vanilla ~/Desktop/neuron_manifold-main/fig5/sample_segre_10k_uniform_1cluster.R 100 5000 10 210 '~/Desktop/neuron_manifold-main/data' 

# uniform 2 clusters
# 300
Rscript --vanilla ~/Desktop/neuron_manifold-main/fig5/sample_segre_10k_uniform_2clusters.R 100 300 10 60 160 210 0.3 '~/Desktop/neuron_manifold-main/data' 

# 3000
Rscript --vanilla ~/Desktop/neuron_manifold-main/fig5/sample_segre_10k_uniform_2clusters.R 100 3000 10 60 160 210 0.3 '~/Desktop/neuron_manifold-main/data' 

# 5000
Rscript --vanilla ~/Desktop/neuron_manifold-main/fig5/sample_segre_10k_uniform_2clusters.R 100 5000 10 60 160 210 0.3 '~/Desktop/neuron_manifold-main/data'  

# make plots
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold-main/fig5/process_data_PCA_segre.m');exit;" | tail -n +11
