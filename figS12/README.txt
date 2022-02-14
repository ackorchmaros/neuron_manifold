############################################################################################################### MLE ID estimation ################################
# author:Annachiara Korchmaros


##################################################### MICE dataset repeat 1
# transpose data
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS12/transpose_data.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold-main/data' '1' '~/Desktop/neuron_manifold-main/figS12/temp'

# compute ID
julia ~/Desktop/neuron_manifold-main/figS12/MLE.jl "~/Desktop/neuron_manifold-main/figS12/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_t.mat" "~/Desktop/neuron_manifold-main/figS12/figs/repeat1_clean_signal_M170714_MP032_2017-08-07_MLE.pdf"

##################################################### MICE dataset repeat 2
# transpose data
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS12/transpose_data.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/dimensionality/neuron_manifold-main/data' '2' '~/Desktop/neuron_manifold-main/figS12/temp'

# compute ID
julia ~/Desktop/neuron_manifold-main/figS12/MLE.jl "~/Desktop/neuron_manifold-main/figS12/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_t.mat" "~/Desktop/neuron_manifold-main/figS12/figs/repeat2_clean_signal_M170714_MP032_2017-08-07_MLE.pdf"

##################################################### segre
# make data
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS12/sample_segre_10k_normal.R 100 3000 10 1 '~/Desktop/neuron_manifold-main/figS12/temp' 

# transpose data
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS12/transpose_data.R '10000ambient_3000sample_199segre_normalSample' "NULL" '~/Desktop/neuron_manifold-main/figS12/data' '0' '~/Desktop/neuron_manifold-main/figS12/temp'

# compute ID
julia ~/Desktop/neuron_manifold-main/figS12/MLE.jl "~/Desktop/neuron_manifold-main/figS12/temp/10000ambient_3000sample_199segre_normalSample_t.mat" "~/Desktop/neuron_manifold-main/figS12/figs/10000ambient_3000sample_199segre_normalSample_MLE.pdf"

