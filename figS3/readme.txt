################################ FIGS S3 ################################
# author:Annachiara Korchmaros
# comments: Eigenspectrum decay for orthogonal group

# sample 3000,300,30 points from a og variety in a space of 10000

Rscript --vanilla ~/Desktop/neuron_manifold/figS3/sample_og_cases_proj.R 10000 3000 '~/Desktop/neuron_manifold/data' 10 1 

# add noise to the sample to create 2 repeats

Rscript --vanilla ~/Desktop/neuron_manifold/figS3/add_noise2og.R 10000 30 '~/Desktop/neuron_manifold/data' 10 0.033 

Rscript --vanilla ~/Desktop/neuron_manifold/figS3/add_noise2og.R 10000 300 '~/Desktop/neuron_manifold/data' 10 0.036 

Rscript --vanilla ~/Desktop/neuron_manifold/figS3/add_noise2og.R 10000 3000 '~/Desktop/neuron_manifold/data' 10 0.037 


# make plots
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold/figS3/process_data_cvPCA_og.m');exit;" | tail -n +11




