clear all;

% !!!!!! update mainpath 
mainpath = '~/Desktop/neuron_manifold';
% where data is stored 
dataroot = sprintf('%s/data', mainpath); 
% where temporary data is stored 
matroot = sprintf('%s/fig10/temp', mainpath); 
mkdir(matroot);
% where plots are saved
myplotroot= sprintf('%s/fig10/figs', mainpath); 
mkdir(myplotroot);
% where other functions are saved
addpath(genpath(sprintf('%s/matlab_functions', mainpath)));
%% FIGURE 10a
% author: Annachiara Korchamros
% sourse: compileResps.m from https://github.com/stringer-pachitariu-et-al-2018b

%inputs
sample_case='10000ambient_3000sample_199segre';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,segre_case);

% plot
plot_powerlaw(matroot, myplotroot,segre_case);
close;

