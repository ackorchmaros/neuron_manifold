clear all;

% !!!!!! update mainpath 
mainpath = '~/Desktop/neuron_manifold';
% where data is stored 
dataroot = sprintf('%s/data', mainpath); 
% where temporary data is stored 
matroot = sprintf('%s/figS3/temp', mainpath); 
mkdir(matroot);
% where plots are saved
myplotroot= sprintf('%s/figS3/figs', mainpath); 
mkdir(myplotroot);
% where other functions are saved
addpath(genpath(sprintf('%s/matlab_functions', mainpath)));
%% FIGURE S3
% author: Annachiara Korchamros
% sourse: compileResps.m from https://github.com/stringer-pachitariu-et-al-2018b

%%%%%%%%%
% fig S3a
%%%%%%%%%
%inputs
og_case='10000ambient_30sample_4950og';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,og_case);

% plot
plot_powerlaw_noAlpha_og(matroot,myplotroot,og_case);
close;

%%%%%%%%%
% fig S3b
%%%%%%%%%
%inputs
og_case='10000ambient_300sample_4950og';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,og_case);

% plot
plot_powerlaw_noAlpha(matroot,myplotroot,og_case);
close;

%%%%%%%%%
% fig S3c
%%%%%%%%%
%inputs
og_case='10000ambient_3000sample_4950og';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,og_case);

% plot
plot_powerlaw_noAlpha_og(matroot,myplotroot,og_case);
close;

disp('Done');