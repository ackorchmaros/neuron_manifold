################################ FIGS 6 S2 ################################
# author:Annachiara Korchmaros
# comments: Eigenspectrum decay for Segres

########## FIG 6

# sample 3000,300,30 points from a segre variety of dimension 199 in a space of 1000
Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/sample_segre_cases_proj.R 10000 3000 '~/Desktop/neuron_manifold/data' 10 

# add noise to the sample to create 2 repeats
Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 10000 30 '~/Desktop/neuron_manifold/data' 10 670 

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 10000 300 '~/Desktop/neuron_manifold/data' 10 740

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 10000 3000 '~/Desktop/neuron_manifold/data' 10 750 

# make plots
# !!!! don't run FIGURE S2
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold/fig6_S2/process_data_cvPCA_variety.m');exit;" | tail -n +11


######## FIG S2

####(a)-(c)

# sample 3000,300,30 points from a segre variety of dimension 19 in a space of 1000
Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/sample_segre_cases_proj.R 100 3000 '~/Desktop/neuron_manifold/data' 10

# add noise to the sample to create 2 repeats
sample_segre_cases_proj
Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 100 30 '~/Desktop/neuron_manifold/data' 10 680 

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 100 300 '~/Desktop/neuron_manifold/data' 10 730 

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 100 3000 '~/Desktop/neuron_manifold/data' 10 750 

####(d)-(f)

#sample 3000,300,30 points from a segre variety of dimension 19 in a space of 70
# add noise to the sample to create 2 repeats

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/sample_segre_cases_Adim.R 70 30 '~/Desktop/neuron_manifold/data'

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 70 30 '~/Desktop/neuron_manifold/data' 10 620

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/sample_segre_cases_Adim.R 70 300 '~/Desktop/neuron_manifold/data'

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 70 300 '~/Desktop/neuron_manifold/data' 10 710

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/sample_segre_cases_Adim.R 70 3000 '~/Desktop/neuron_manifold/data'

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 70 3000 '~/Desktop/neuron_manifold/data' 10 750 

####(g)-(i)

#sample 3000,300,30 points from a segre variety of dimension 19 in a space of 40

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/sample_segre_cases_Adim.R 40 30 '~/Desktop/neuron_manifold/data'

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 40 30 '~/Desktop/neuron_manifold/data' 10 950

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/sample_segre_cases_Adim.R 40 300 '~/Desktop/neuron_manifold/data'

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 40 300 '~/Desktop/neuron_manifold/data' 10 770

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/sample_segre_cases_Adim.R 40 3000 '~/Desktop/neuron_manifold/data'

Rscript --vanilla ~/Desktop/neuron_manifold/fig6_S2/add_noise2segre.R 40 3000 '~/Desktop/neuron_manifold/data' 10 750 

# make plots
# !!!! don't run FIGURE 6
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold/fig6_S2/process_data_cvPCA_variety.m');exit;" | tail -n +11


