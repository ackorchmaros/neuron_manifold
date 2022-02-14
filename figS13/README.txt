############################################################################################################### NPCA ID estimation ################################
# author:Annachiara Korchmaros

mkdir ~/Desktop/neuron_manifold-main/figS13/figs

########################################################################### figure (a)-(c) 
################################# MICE dataset repeat 1
julia  ~/Desktop/neuron_manifold-main/figS13/kBreiding.jl "~/Desktop/neuron_manifold-main/data/repeat1_clean_signal_M170714_MP032_2017-08-07.mat" "~/Desktop/neuron_manifold-main/figS13/figs/repeat1_clean_signal_M170714_MP032_2017-08-07_NPCA_Bk.pdf" "~/Desktop/neuron_manifold-main/figS13/figs/repeat1_clean_signal_M170714_MP032_2017-08-07_NPCA_Bk_d.txt" "~/Desktop/neuron_manifold-main/figS13/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_euclidean_NN_matrix.mat" > ~/Desktop/neuron_manifold-main/figS13/dimensions/kBreiding_repeat1_d.txt
 
################################# MICE dataset repeat 2
julia ~/Desktop/neuron_manifold-main/figS13/kBreiding.jl "~/Desktop/neuron_manifold-main/data/repeat2_clean_signal_M170714_MP032_2017-08-07.mat" "~/Desktop/neuron_manifold-main/figS13/figs/repeat2_clean_signal_M170714_MP032_2017-08-07_NPCA_Bk.pdf" "~/Desktop/neuron_manifold-main/figS13/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_euclidean_NN_matrix.mat" > ~/Desktop/neuron_manifold-main/figS13/dimensions/kBreiding_repeat2_d.txt
 

################################# segre
# make data
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS13/sample_segre_10k_normal.R 100 3000 10 1 '~/Desktop/neuron_manifold-main/figS13/temp' 

julia ~/Desktop/neuron_manifold-main/figS13/kBreiding.jl "~/Desktop/neuron_manifold-main/figS13/temp/10000ambient_3000sample_199segre_normalSample.mat" "~/Desktop/neuron_manifold-main/figS13/figs/10000ambient_3000sample_199segre_normalSample_NPCA_Bk.pdf" "~/Desktop/neuron_manifold-main/figS13/temp/10000ambient_3000sample_199segre_normalSample_euclidean_NN_matrix.mat" > ~/Desktop/neuron_manifold-main/figS13/dimensions/10000ambient_3000sample_199segre_normalSample_NPCA_Bk_d.txt


########################################################################### figure (g)-(i)
################################# MICE dataset repeat 1 
# transpose data
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS13/transpose_data.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold-main/data' '1' '~/Desktop/neuron_manifold-main/figS13/temp'

# compute ID
julia ~/Desktop/neuron_manifold-main/figS13/epsBreiding.jl "~/Desktop/neuron_manifold-main/figS13/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_t.mat" "~/Desktop/neuron_manifold-main/figS13/figs/repeat1_clean_signal_M170714_MP032_2017-08-07_NPCA_Beps.pdf"

################################# MICE dataset repeat 2
# transpose data
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS13/transpose_data.R 'M170714_MP032_2017-08-07' "clean_signal" '~/Desktop/neuron_manifold-main/data' '2' '~/Desktop/neuron_manifold-main/figS13/temp'

# compute ID
julia ~/Desktop/neuron_manifold-main/figS13/epsBreiding.jl "~/Desktop/neuron_manifold-main/figS13/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_t.mat" "~/Desktop/neuron_manifold-main/figS13/figs/repeat2_clean_signal_M170714_MP032_2017-08-07_NPCA_Beps.pdf"

################################# segre
# transpose data
Rscript --vanilla ~/Desktop/neuron_manifold-main/figS13/transpose_data.R '10000ambient_3000sample_199segre_normalSample' "NULL" '~/Desktop/neuron_manifold-main/figS13/temp' '0' '~/Desktop/neuron_manifold-main/figS13/temp'

# compute ID
julia ~/Desktop/neuron_manifold-main/figS13/epsBreiding.jl "~/Desktop/neuron_manifold-main/figS13/temp/10000ambient_3000sample_199segre_normalSample_t.mat" "~/Desktop/neuron_manifold-main/figS13/figs/10000ambient_3000sample_199segre_normalSample_NPCA_Beps.pdf"

########################################################################### figure (d)-(f)
##################################################### MICE dataset repeat 1 
julia ~/Desktop/neuron_manifold-main/figS13/epsTh.jl "~/Desktop/neuron_manifold-main/figS13/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_t.mat" "~/Desktop/neuron_manifold-main/figS13/figs/repeat1_clean_signal_M170714_MP032_2017-08-07_NPCA_epsTh.pdf" > ~/Desktop/neuron_manifold-main/figS13/dimensions/repeat1_clean_signal_M170714_MP032_2017-08-07_NPCA_epsTh_d.txt

##################################################### MICE dataset repeat 2
julia ~/Desktop/neuron_manifold-main/figS13/epsTh.jl "~/Desktop/neuron_manifold-main/figS13/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_t.mat" "~/Desktop/neuron_manifold-main/figS13/figs/repeat2_clean_signal_M170714_MP032_2017-08-07_NPCA_epsTh.pdf" > ~/Desktop/neuron_manifold-main/figS13/dimensions/repeat2_clean_signal_M170714_MP032_2017-08-07_NPCA_epsTh_d.txt

##################################################### segre
julia ~/Desktop/neuron_manifold-main/figS13/epsTh.jl "~/Desktop/neuron_manifold-main/figS13/temp/10000ambient_3000sample_199segre_normalSample_t.mat" "~/Desktop/neuron_manifold-main/figS13/figs/10000ambient_3000sample_199segre_normalSample_NPCA_epsTh.pdf" > ~/Desktop/neuron_manifold-main/figS13/dimensions/10000ambient_3000sample_199segre_normalSample_NPCA_epsTh_d.txt

########################################################################### figure (j)-(l)
##################################################### MICE dataset repeat 1 
julia ~/Desktop/neuron_manifold-main/figS13/kTh.jl "~/Desktop/neuron_manifold-main/data/repeat1_clean_signal_M170714_MP032_2017-08-07.mat" "~/Desktop/neuron_manifold-main/figS13/figs/repeat1_clean_signal_M170714_MP032_2017-08-07_NPCA_Thk.pdf" "~/Desktop/neuron_manifold-main/figS13/temp/repeat1_clean_signal_M170714_MP032_2017-08-07_euclidean_NN_matrix.mat" > ~/Desktop/neuron_manifold-main/figS13/dimensions/repeat1_clean_signal_M170714_MP032_2017-08-07_NPCA_Thk_d.txt

##################################################### MICE dataset repeat 2 
julia ~/Desktop/neuron_manifold-main/figS13/kTh.jl "~/Desktop/neuron_manifold-main/data/repeat2_clean_signal_M170714_MP032_2017-08-07.mat" "~/Desktop/neuron_manifold-main/figS13/figs/repeat2_clean_signal_M170714_MP032_2017-08-07_NPCA_Thk.pdf" "~/Desktop/neuron_manifold-main/figS13/temp/repeat2_clean_signal_M170714_MP032_2017-08-07_euclidean_NN_matrix.mat" > ~/Desktop/neuron_manifold-main/figS13/dimensions/repeat2_clean_signal_M170714_MP032_2017-08-07_NPCA_Thk_d.txt

##################################################### Segre 
julia ~/Desktop/neuron_manifold-main/figS13/kTh.jl "~/Desktop/neuron_manifold-main/figS13/temp/10000ambient_3000sample_199segre_normalSample.mat" "~/Desktop/neuron_manifold-main/figS13/figs/10000ambient_3000sample_199segre_normalSample_NPCA_Thk.pdf" "~/Desktop/neuron_manifold-main/figS13/temp/10000ambient_3000sample_199segre_normalSample_euclidean_NN_matrix.mat" > ~/Desktop/neuron_manifold-main/figS13/dimensions/10000ambient_3000sample_199segre_normalSample_NPCA_Thk_d.txt




