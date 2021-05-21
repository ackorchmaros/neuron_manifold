################################ FIG 10 ################################
# author:Annachiara Korchmaros
# comments: Eigenspectrum decay for Segres with cvPCA and cvPCA with shuffling

# sample 3000 points from a segre variety of dimension 199 in a space of 10000
# !! don't run step (6) and (7)
Rscript --vanilla ~/Desktop/neuron_manifold-main/fig10/sample_segre_cases_proj.R 10000 3000 '~/Desktop/neuron_manifold-main/data' 10 

# add noise to the sample to create 2 repeats
Rscript --vanilla ~/Desktop/neuron_manifold-main/fig10/add_noise2segre.R 10000 3000 '~/Desktop/neuron_manifold-main/data' 10 750 

# plot fig10a
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold-main/fig10/process_data_cvPCA_variety_alpha.m');exit;" | tail -n +11

# plot fig10b
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold-main/fig10/process_data_cvPCA_variety_alpha_shuffle.m');exit;" | tail -n +11



