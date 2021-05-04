################################ FIGS 11 and S8  ################################
# author:Annachiara Korchmaros

##################### FIGS 11

# Load mice dataset (2 repeats 1 mouse) 

/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold/matlab_functions/load_main_example_full_1step_preprocess.m');exit;" | tail -n +11

##### Fig 11a,g
# distribution of average 
# zoom [-0.25,0.75]
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/hist_average.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig11_S8/figs' "~/Desktop/neuron_manifold/fig11_S8/temp"

##### Fig 11b,h
# distribution of median 
# zoom [-2,0.2]
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/hist_median.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig11_S8/figs' "~/Desktop/neuron_manifold/fig11_S8/temp"

##### Fig 11c,i
# distribution of variance 
# zoom [-0,2,5]
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/hist_variance.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig11_S8/figs' "~/Desktop/neuron_manifold/fig11_S8/temp"

##### Fig 11d,j
# distribution of range  90%-10%
# zoom [0,10]
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/hist_ranges.R 'M170714_MP032_2017-08-07' 'clean_signal' '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig11_S8/figs' "~/Desktop/neuron_manifold/fig11_S8/temp"

##### Fig 11e,k
# naive entropy
## counts
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/counts_signal.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig11_S8/temp' 

## entropy
# source: https://github.com/gregversteeg/NPEET
cd /Desktop/neuron_manifold/fig11_S8/NPEET
python3 naive_entropy.py -i ~/Desktop/neuron_manifold/fig11_S8/temp/matrix_counts_clean_signal_M170714_MP032_2017-08-07.csv -o ~/Desktop/neuron_manifold/fig11_S8/temp/nEntropy_signal_clean_signal_M170714_MP032_2017-08-07.txt

## plot
# zoom [0.7,1.3]
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/hist_entropy.R 'M170714_MP032_2017-08-07' 'clean_signal' "~/Desktop/neuron_manifold/fig11_S8/temp" 'nEntropy' '~/Desktop/neuron_manifold/fig11_S8/figs' 

##### Fig 11f,l
# differential entropy
## entropy
cd Desktop/neuron_manifold/fig11_S8/NPEET
python3 dif_entropy_clean_signal.py -i ~/Desktop/neuron_manifold/data/clean_signal_M170714_MP032_2017-08-07.mat  -o ~/Desktop/neuron_manifold/fig11_S8/temp/dEntropy_signal_clean_signal_M170714_MP032_2017-08-07.txt

## plot
# zoom [0.5,3.5]
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/hist_entropy.R 'M170714_MP032_2017-08-07' 'clean_signal' "~/Desktop/neuron_manifold/fig11_S8/temp" 'dEntropy' '~/Desktop/neuron_manifold/fig11_S8/figs' 


# FIGS S8
##### Fig S8a,g
# distribution of average 
# max 100 
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/hist_average.R 'M170714_MP032_2017-08-07' 'clean_redCells_signal' '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig11_S8/figs' "~/Desktop/neuron_manifold/fig11_S8/temp"

##### Fig S8b,h
# distribution of median 
# zoom [0,30]
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/hist_median.R 'M170714_MP032_2017-08-07' 'clean_redCells_signal' '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig11_S8/figs' "~/Desktop/neuron_manifold/fig11_S8/temp"

##### Fig S8c,i
# distribution of variance 
# zoom [0,50000]
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/hist_variance.R 'M170714_MP032_2017-08-07' 'clean_redCells_signal' '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig11_S8/figs' "~/Desktop/neuron_manifold/fig11_S8/temp"

##### Fig S8d,j
# distribution of range  90%-10%
# zoom [0 400]
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/hist_ranges.R 'M170714_MP032_2017-08-07' 'clean_redCells_signal' '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig11_S8/figs' "~/Desktop/neuron_manifold/fig11_S8/temp"

##### Fig S8e,k
# naive entropy

## counts
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/counts_signal.R 'M170714_MP032_2017-08-07' 'clean_redCells_signal' '~/Desktop/neuron_manifold/data' '~/Desktop/neuron_manifold/fig11_S8/temp' 

## entropy
python3 naive_entropy.py -i ../../data/statistics/matrix_counts_clean_redCells_signal_M170714_MP032_2017-08-07.csv -o ../../data/statistics/nEntropy_signal_clean_redCells_signal_M170714_MP032_2017-08-07.txt

## plot
# zoom [0.7,1.1]
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/hist_entropy.R 'M170714_MP032_2017-08-07' 'clean_redCells_signal' "~/Desktop/neuron_manifold/fig11_S8/temp" 'nEntropy' '~/Desktop/neuron_manifold/fig11_S8/figs' 

##### Fig S8f,l
# differential entropy

## format data for python
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/clean_red_cells_signal_py.R 'M170714_MP032_2017-08-07' '~/Desktop/neuron_manifold/data' "~/Desktop/neuron_manifold/fig11_S8/temp"

## entropy
cd Desktop/neuron_manifold/fig11_S8/NPEET
python3 dif_entropy.py -i ~/Desktop/neuron_manifold/fig11_S8/temp/4py_clean_redCells_signal_M170714_MP032_2017-08-07.csv  -o ~/Desktop/neuron_manifold/fig11_S8/temp/dEntropy_signal_clean_redCells_signal_M170714_MP032_2017-08-07.txt

## plot
# zoom [-12,-5]
Rscript --vanilla ~/Desktop/neuron_manifold/fig11_S8/hist_entropy.R 'M170714_MP032_2017-08-07' 'clean_redCells_signal' "~/Desktop/neuron_manifold/fig11_S8/temp" 'dEntropy' '~/Desktop/neuron_manifold/fig11_S8/figs' 