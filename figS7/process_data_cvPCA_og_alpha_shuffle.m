clear all;

% !!!!!! update mainpath 
mainpath = '~/Desktop/neuron_manifold-main';
% where data is stored 
dataroot = sprintf('%s/data', mainpath); 
% where temporary data is stored 
matroot = sprintf('%s/figS7/temp', mainpath); 
mkdir(matroot);
% where plots are saved
myplotroot= sprintf('%s/figS7/figs', mainpath); 
mkdir(myplotroot);
% where other functions are saved
addpath(genpath(sprintf('%s/matlab_functions', mainpath)));
%% FIGURE S7b
% author: Annachiara Korchamros
%inputs
og_case='10000ambient_3000sample_4950og';

% compute cvPCA variances 
compute_cvPCA_eigs_shuffle(dataroot, matroot,og_case);

% plot
plot_powerlaw_alpha_shuffle_og(matroot,myplotroot,og_case);
close;

disp('Done');