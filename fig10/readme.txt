################################ FIG 10 ################################
# author:Annachiara Korchmaros
# comments: Eigenspectrum decay for Segres with cvPCA and cvPCA with shuffling


/////////////////// case 10000 ambient space dimension with 10 vector means
# sample 3000 from a segre variety of dimension 199 in a space of 1000
Rscript --vanilla /Users/korchma1/Desktop/dimensionality/scripts/sample_segre_cases_100Adim_non0mean.R 10000 3000 '~/Desktop/dimensionality/data/segre' 10 

# add noise to the sample to create 2 repeats

Rscript --vanilla /Users/korchma1/Desktop/dimensionality/scripts/add_noise2segre.R 10000 3000 '~/Desktop/dimensionality/data/segre' 10 750 // correlation 0.21

#make plots
// no permutations
open /Users/korchma1/Desktop/dimensionality/scripts/stringer-pachitariu-et-al-2018b-master/process_data_segre_ak.m 
segre_case='10000ambient_3000sample_199segre'
plot option:orded_fig2_segre_ak

// permutation columns
open /Users/korchma1/Desktop/dimensionality/scripts/stringer-pachitariu-et-al-2018b-master/process_data_segre_2repeats_permute_col_ak.m 
segre_case='10000ambient_3000sample_199segre'


# sample 3000 points from a segre variety of dimension 199 in a space of 10000
Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/sample_segre_cases_proj.R 10000 3000 '~/Desktop/neuron_manifold/data' 10 

# add noise to the sample to create 2 repeats
Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 10000 30 '~/Desktop/neuron_manifold/data' 10 670 

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 10000 300 '~/Desktop/neuron_manifold/data' 10 740

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 10000 3000 '~/Desktop/neuron_manifold/data' 10 750 

# make plots
# !!!! don't run FIGURE S2
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold/fig6_S2/process_data_cvPCA_variety.m');exit;" | tail -n +11
