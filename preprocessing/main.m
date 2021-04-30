clear all;

% !!!!!! update mainpath 
mainpath = '~/Desktop/neuron_manifold';
% where data is stored 
dataroot = sprintf('%s/data', mainpath); 
% where other functions are saved
addpath(genpath(sprintf('%s/matlab_functions', mainpath)));
%% PREPROCESSING
% author: Annachiara Korchamros
% sourse: compileResps.m from https://github.com/stringer-pachitariu-et-al-2018b

% full preprocess
% compute two repeats from sequence of stimuli and responses
% discard responses from red cells (GAD+ neurons)
% subtracts 32 spontaneous components (nPCspont)
% keep stimuli that weren't repeated twice (they will be nan's in the matrix, default is 0)
% note: different number of neurones per mouse; respAll{4} is the example we have being using
% output:natimg2800_proc.mat; data are in respAll
useGPU=0;
full_preprocess(dataroot,useGPU);

% first step preprocess
% compute two repeats from sequence of stimuli and responses
% discard responses from red cells (GAD+ neurons)
% keep stimuli that weren't repeated twice (they will be nan's in the matrix, default is 0)
first_step_preprocess(dataroot);