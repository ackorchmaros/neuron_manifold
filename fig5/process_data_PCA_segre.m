clear all;

% !!!!!! update mainpath 
mainpath = '~/Desktop/neuron_manifold-main';
% where data is stored 
dataroot = sprintf('%s/data', mainpath); 
% where temporary data is stored 
matroot = sprintf('%s/fig5/temp', mainpath); 
mkdir(matroot);
% where plots are saved
myplotroot= sprintf('%s/fig5/figs', mainpath); 
mkdir(myplotroot);
% where other functions are saved
addpath(genpath(sprintf('%s/matlab_functions', mainpath)));
%% FIGURE 5
% author: Annachiara Korchamros

% set some common variables
normal='normalSample';
uniform_cluster1='1clusterUniformSample';
uniform_cluster2='2clusterUniformSample';

%%%%%%%%%
% fig 5a
%%%%%%%%%
%inputs
sample_case='10000ambient_300sample_199segre';
dimension='199';
sample_size='300';

% compute PCA for each method 
compute_PCA_eigs(dataroot, matroot,sample_case,normal);
compute_PCA_eigs(dataroot, matroot,sample_case,uniform_cluster1);
compute_PCA_eigs(dataroot, matroot,sample_case,uniform_cluster2);

% plot
plots(matroot,myplotroot,sample_case,normal,uniform_cluster1,uniform_cluster2,dimension,sample_size);
close;

%%%%%%%%%
% fig 5b
%%%%%%%%%
%inputs
sample_case='10000ambient_3000sample_199segre';
dimension='199';
sample_size='3000';

% compute PCA for each method 
compute_PCA_eigs(dataroot, matroot,sample_case,normal);
compute_PCA_eigs(dataroot, matroot,sample_case,uniform_cluster1);
compute_PCA_eigs(dataroot, matroot,sample_case,uniform_cluster2);

% plot
plots(matroot,myplotroot,sample_case,normal,uniform_cluster1,uniform_cluster2,dimension,sample_size);
close;

%%%%%%%%%
% fig 5c
%%%%%%%%%
%inputs
sample_case='10000ambient_5000sample_199segre';
dimension='199';
sample_size='5000';

% compute PCA for each method 
compute_PCA_eigs(dataroot, matroot,sample_case,normal);
compute_PCA_eigs(dataroot, matroot,sample_case,uniform_cluster1);
compute_PCA_eigs(dataroot, matroot,sample_case,uniform_cluster2);

% plot
plots(matroot,myplotroot,sample_case,normal,uniform_cluster1,uniform_cluster2,dimension,sample_size);
close;

disp('Done');