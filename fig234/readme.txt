################################ FIGURES 2-4 ################################
# author:Annachiara Korchmaros

# Load mice dataset (2 repeats 1 mouse) from figshare

/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold/fig234/load_main_example.m');exit;" | tail -n +11

# Convert to format: 2(numb. stimuli) x numb. neurons

Rscript --vanilla ~/Desktop/neuron_manifold/fig234/convert_signal_matlab.R 'M170714_MP032_2017-08-07' '~/Desktop/neuron_manifold/data'

# Make simulated data and plots

/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold/fig234/main.m');exit;" | tail -n +11