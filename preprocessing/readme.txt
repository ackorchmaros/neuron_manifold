################################ PREPROCESS ################################
# author:Annachiara Korchmaros

# Download from figshare and save in /data folder
# natimg2800_M160825_MP027_2016-12-14.mat
# natimg2800_M170717_MP033_2017-08-20.mat
# natimg2800_M170714_MP032_2017-09-14.mat
# natimg2800_M161025_MP030_2017-05-29.mat
# natimg2800_M170717_MP034_2017-09-11.mat
# main example: natimg2800_M170714_MP032_2017-08-07.mat

# Run full and first step preprocess for all mice

/Applications/MATLAB_R2019b.app/bin/matlab -nodisplay -nosplash -nodesktop -r "run('~/Desktop/neuron_manifold-main/preprocessing/main.m');exit;" | tail -n +11

