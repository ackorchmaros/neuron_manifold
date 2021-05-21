################################ FIG S9  ################################
# author:Annachiara Korchmaros
# goal: correlation of 300 neurones

# Load mice dataset (2 repeats 1 mouse) full and 1st step preprocess
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold-main/matlab_functions/load_main_example_full_1step_preprocess.m');exit;" | tail -n +11

# figS9a,c
# zoom [-.2,.2]
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS9/hist_correlation.R 'M170714_MP032_2017-08-07' 'clean_signal' '~/Desktop/neuron_manifold-main/data' '~/Desktop/neuron_manifold-main/figS9/figs' "~/Desktop/neuron_manifold-main/figS9/temp"

# figS9b,d
# zoom [-0.05, 0.2]
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS9/hist_correlation.R 'M170714_MP032_2017-08-07' 'clean_redCells_signal' '~/Desktop/neuron_manifold-main/data' '~/Desktop/neuron_manifold-main/figS9/figs' "~/Desktop/neuron_manifold-main/figS9/temp"

