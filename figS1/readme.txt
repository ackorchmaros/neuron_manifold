################################ Test how the eigenvalues change accordingly to sample size and sampling method ################################
# author:Annachiara Korchmaros
# first update: 1.4.2021 Aalto
# last update: 19.4.2021 Aalto

// normal sampling
# 300 R
Rscript --vanilla /Users/korchma1/Desktop/dimensionality/scripts/sample_so_10k_normal.R 400 300 100 27 '~/Desktop/dimensionality/data/so' 

// uniform 1 cluster
# 300 R
Rscript --vanilla /Users/korchma1/Desktop/dimensionality/scripts/sample_so_10k_uniform_1cluster.R 400 300 10 210 '~/Desktop/dimensionality/data/so' 

// uniform 2 clusters
# 300 R
Rscript --vanilla /Users/korchma1/Desktop/dimensionality/scripts/sample_so_10k_uniform_2clusters.R 400 300 10 60 160 210 0.3 '~/Desktop/dimensionality/data/so' 

// make plots

run /Users/korchma1/Desktop/dimensionality/scripts/stringer-pachitariu-et-al-2018b-master/process_data_PCA_variety_ak.m
with
sample_size='400ambient_300sample_190so'; 
