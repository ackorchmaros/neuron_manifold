################################ FIGS 9, S5 and S6  ################################
# author:Annachiara Korchmaros

# FIGURES 9a, S5a-f, S6a
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold/fig9_S5_S6/process_data_cvPCA_mice.m');exit;" | tail -n +11

# FIGURES 9b, S5g-l, S6b
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold/fig9_S5_S6/process_data_cvPCA_mice_shuffle.m');exit;" | tail -n +11