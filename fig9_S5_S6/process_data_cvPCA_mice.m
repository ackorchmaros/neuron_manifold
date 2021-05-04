clear all;

% !!!!!! update mainpath 
mainpath = '~/Desktop/neuron_manifold';
% where data is stored 
dataroot = sprintf('%s/data', mainpath); 
% where temporary data is stored 
matroot = sprintf('%s/fig9_S5_S6/temp', mainpath); 
mkdir(matroot);
% where plots are saved
myplotroot= sprintf('%s/fig9_S5_S6/figs', mainpath); 
mkdir(myplotroot);

%% FIGURES 9a, S5a-f, S6a
% author: Annachiara Korchamros
% sourse: compileResps.m from https://github.com/stringer-pachitariu-et-al-2018b

%%%%%%%%%%%%%%%%%%%%%%
% fig 9a and S5a-f
%%%%%%%%%%%%%%%%%%%%%%
% run cvPCA
cvPCA_eigs_mice(dataroot, matroot);

% plot
plot_mice_powerlaw(matroot,myplotroot);

%%%%%%%%%%%%%%%%%%%%%%
% fig S6a
%%%%%%%%%%%%%%%%%%%%%%
% run cvPCA
cvPCA_eigs_redCells(dataroot, matroot);

% plot
plot_mice_powerlaw_redCells(matroot,myplotroot);




