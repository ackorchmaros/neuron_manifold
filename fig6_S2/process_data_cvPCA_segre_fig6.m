clear all;

% !!!!!! update mainpath 
mainpath = '~/Desktop/neuron_manifold-main';
% where data is stored 
dataroot = sprintf('%s/data', mainpath); 
% where temporary data is stored 
matroot = sprintf('%s/fig6_S2/temp', mainpath); 
mkdir(matroot);
% where plots are saved
myplotroot= sprintf('%s/fig6_S2/figs', mainpath); 
mkdir(myplotroot);
% where other functions are saved
addpath(genpath(sprintf('%s/matlab_functions', mainpath)));
%% FIGURE 6
% author: Annachiara Korchamros
% sourse: compileResps.m from https://github.com/stringer-pachitariu-et-al-2018b

%%%%%%%%%
% fig 6a
%%%%%%%%%
%inputs
segre_case='10000ambient_30sample_199segre';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,segre_case);

% plot
plot_powerlaw_noAlpha(matroot,myplotroot,segre_case);
close;

%%%%%%%%%
% fig 6b
%%%%%%%%%
%inputs
segre_case='10000ambient_300sample_199segre';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,segre_case);

% plot
plot_powerlaw_noAlpha(matroot,myplotroot,segre_case);
close;

%%%%%%%%%
% fig 6c
%%%%%%%%%
%inputs
segre_case='10000ambient_3000sample_199segre';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,segre_case);

% plot
plot_powerlaw_noAlpha(matroot,myplotroot,segre_case);
close;

disp('Done');