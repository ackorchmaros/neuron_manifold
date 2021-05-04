################################ FIG S7 ################################
# author:Annachiara Korchmaros
# comments: Eigenspectrum decay for orthogonal group with cvPCA and cvPCA with shuffling

# sample 3000 from a og variety in a space of 10000
Rscript --vanilla ~/Desktop/neuron_manifold/figS7/sample_og_cases_proj.R 10000 3000 '~/Desktop/neuron_manifold/data' 10 1 

# add noise to the sample to create 2 repeats
Rscript --vanilla ~/Desktop/neuron_manifold/figS7/add_noise2og.R 10000 3000 '~/Desktop/neuron_manifold/data' 10 0.037 

#figS7a
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold/figS7/process_data_cvPCA_og_alpha.m');exit;" | tail -n +11

#figS7b
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold/figS7/process_data_cvPCA_og_alpha_shuffle.m.m');exit;" | tail -n +11
