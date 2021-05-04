################################ FIGURES 12 and S10 ################################
# author:Annachiara Korchmaros
# goal : neuronal response ranks vs. statistic

# Load mice dataset (2 repeats 1 mouse) full and 1st step preprocess
/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold/matlab_functions/load_main_example_full_1step_preprocess.m');exit;" | tail -n +11


######### figures 12

### fig 12a
# mean
Rscript --vanilla ~/Desktop/neuron_manifold/fig12_S10/plot_signal_ranks_magnitudo.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig12_S10/temp' 'Mean' '~/Desktop/neuron_manifold/fig12_S10/figs'

### fig 12b
#median
Rscript --vanilla ~/Desktop/neuron_manifold/fig12_S10/plot_signal_ranks_magnitudo.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig12_S10/temp' 'Median' '~/Desktop/neuron_manifold/fig12_S10/figs'

### fig 12d
#variance
Rscript --vanilla ~/Desktop/neuron_manifold/fig12_S10/plot_signal_ranks_magnitudo.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig12_S10/temp' 'Variance' '~/Desktop/neuron_manifold/fig12_S10/figs'

### fig 12c
# range neuronal signal 90%-10%
Rscript --vanilla ~/Desktop/neuron_manifold/fig12_S10/plot_signal_ranks_magnitudo.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig12_S10/temp' 'Range' '~/Desktop/neuron_manifold/fig12_S10/figs'

### fig 12e
# naive entropy
Rscript --vanilla ~/Desktop/neuron_manifold/fig12_S10/plot_signal_ranks_magnitudo.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig12_S10/temp' 'nEntropy' '~/Desktop/neuron_manifold/fig12_S10/figs'

### fig 12f
# differential entropy
Rscript --vanilla ~/Desktop/neuron_manifold/fig12_S10/plot_signal_ranks_magnitudo.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig12_S10/temp' 'dEntropy' '~/Desktop/neuron_manifold/fig12_S10/figs'


######### figures S10

### fig S10a
# mean
Rscript --vanilla ~/Desktop/neuron_manifold/fig12_S10/plot_signal_ranks_magnitudo.R 'M170714_MP032_2017-08-07' "clean_redCells_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig12_S10/temp' 'Mean' '~/Desktop/neuron_manifold/fig12_S10/figs'

### fig S10b
#median
Rscript --vanilla ~/Desktop/neuron_manifold/fig12_S10/plot_signal_ranks_magnitudo.R 'M170714_MP032_2017-08-07' "clean_redCells_signal"  '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig12_S10/temp' 'Median' '~/Desktop/neuron_manifold/fig12_S10/figs'

### fig S10d
#variance
Rscript --vanilla ~/Desktop/neuron_manifold/fig12_S10/plot_signal_ranks_magnitudo.R 'M170714_MP032_2017-08-07' "clean_redCells_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig12_S10/temp' 'Variance' '~/Desktop/neuron_manifold/fig12_S10/figs'

### fig S10c
#range neuronal signal 90%-10%
Rscript --vanilla ~/Desktop/neuron_manifold/fig12_S10/plot_signal_ranks_magnitudo.R 'M170714_MP032_2017-08-07' "clean_redCells_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig12_S10/temp' 'Range' '~/Desktop/neuron_manifold/fig12_S10/figs'

### fig S10e
# naive entropy
Rscript --vanilla ~/Desktop/neuron_manifold/fig12_S10/plot_signal_ranks_magnitudo.R 'M170714_MP032_2017-08-07' "clean_redCells_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig12_S10/temp' 'nEntropy' '~/Desktop/neuron_manifold/fig12_S10/figs'

### fig S10f
# differential entropy
Rscript --vanilla ~/Desktop/neuron_manifold/fig12_S10/plot_signal_ranks_magnitudo.R 'M170714_MP032_2017-08-07' "clean_redCells_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig12_S10/temp' 'dEntropy' '~/Desktop/neuron_manifold/fig12_S10/figs'













