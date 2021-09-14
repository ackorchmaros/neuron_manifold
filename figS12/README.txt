############################################################################################################### MLE ID estimation ################################
# author:Annachiara Korchmaros


##################################################### MICE dataset repeat 1
# transpose data
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS12/MLE/transpose_data.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold-main/data' '1' '~/Desktop/neuron_manifold-main/figS12/MLE/temp'

# compute ID
julia ~/Desktop/neuron_manifold-main/figS12/MLE/MLE.jl "~/Desktop/neuron_manifold-main/figS12/MLE/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_t.mat" "~/Desktop/neuron_manifold-main/figS12/MLE/figs/repeat1_clean_signal_M170714_MP032_2017-08-07_MLE.pdf"

##################################################### MICE dataset repeat 2
# transpose data
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS12/MLE/transpose_data.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/dimensionality/neuron_manifold-main/data' '2' '~/Desktop/neuron_manifold-main/figS12/MLE/temp'

# compute ID
julia ~/Desktop/neuron_manifold-main/figS12/MLE/MLE.jl "~/Desktop/neuron_manifold-main/figS12/MLE/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_t.mat" "~/Desktop/neuron_manifold-main/figS12/MLE/figs/repeat2_clean_signal_M170714_MP032_2017-08-07_MLE.pdf"

##################################################### segre
# transpose data
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS12/MLE/transpose_data.R '10000ambient_3000sample_199segre_normalSample' "NULL" '~/Desktop/neuron_manifold-main/figS12/data' '0' '~/Desktop/neuron_manifold-main/figS12/MLE/temp'

# compute ID
julia ~/Desktop/neuron_manifold-main/figS12/MLE/MLE.jl "~/Desktop/neuron_manifold-main/figS12/MLE/temp/10000ambient_3000sample_199segre_normalSample_t.mat" "~/Desktop/neuron_manifold-main/figS12/MLE/figs/10000ambient_3000sample_199segre_normalSample_MLE.pdf"

