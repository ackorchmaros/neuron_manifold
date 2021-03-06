clear all;

% !!!!!! update mainpath 
mainpath = '~/Desktop/neuron_manifold-main';
% where data is stored 
dataroot = sprintf('%s/data', mainpath); 
% where temporary data is stored 
matroot = sprintf('%s/fig9_S5_S6/temp', mainpath); 
mkdir(matroot);
% where plots are saved
myplotroot= sprintf('%s/fig9_S5_S6/figs', mainpath); 
mkdir(myplotroot);
% where other functions are saved
addpath(genpath(sprintf('%s/matlab_functions', mainpath)));

%% FIGURES 9b, S5g-l, S6b
% author: Annachiara Korchamros
% sourse: compileResps.m from https://github.com/stringer-pachitariu-et-al-2018b
% running time: at most 1h30min for 20 permutations

%%%%%%%%%%
% fig 9b 
%%%%%%%%%%
disp('Making fig 9b');
mouse_tag='M170714_MP032_2017-08-07';
mouse=4; 

% run cvPCA with shuffling
cvPCA_eigs_mice_shuffle(dataroot, matroot,mouse_tag,mouse);

% plot
plot_mice_powerlaw_shuffle_fig9b(matroot, myplotroot,mouse_tag);

%%%%%%%%%%
% fig S5g 
%%%%%%%%%%
disp('Making fig S5g-l');

mouse_tag='M160825_MP027_2016-12-14';
mouse=1; 

% run cvPCA with shuffling
cvPCA_eigs_mice_shuffle(dataroot, matroot,mouse_tag,mouse);

% plot
plot_mice_powerlaw_shuffle_figS5g(matroot, myplotroot,mouse_tag);

%%%%%%%%%%
% fig S5h
%%%%%%%%%%
mouse_tag='M161025_MP030_2017-05-29';
mouse=2; 

% run cvPCA with shuffling
cvPCA_eigs_mice_shuffle(dataroot, matroot,mouse_tag,mouse);

% plot
plot_mice_powerlaw_shuffle_figS5h(matroot, myplotroot,mouse_tag);

%%%%%%%%%%
% fig S5i
%%%%%%%%%%
mouse_tag='M170604_MP031_2017-06-28';
mouse=3; 

% run cvPCA with shuffling
cvPCA_eigs_mice_shuffle(dataroot, matroot,mouse_tag,mouse);

% plot
plot_mice_powerlaw_shuffle_figS5i(matroot, myplotroot,mouse_tag);

%%%%%%%%%%
% fig S5j
%%%%%%%%%%
mouse_tag='M170714_MP032_2017-09-14';
mouse=5; 

% run cvPCA with shuffling
cvPCA_eigs_mice_shuffle(dataroot, matroot,mouse_tag,mouse);

% plot
plot_mice_powerlaw_shuffle_figS5j(matroot, myplotroot,mouse_tag);

%%%%%%%%%%
% fig S5k
%%%%%%%%%%
mouse_tag='M170717_MP033_2017-08-20';
mouse=6; 

% run cvPCA with shuffling
cvPCA_eigs_mice_shuffle(dataroot, matroot,mouse_tag,mouse);

% plot
plot_mice_powerlaw_shuffle_figS5k(matroot, myplotroot,mouse_tag);

%%%%%%%%%%
% fig S5l
%%%%%%%%%%
mouse_tag='M170717_MP034_2017-09-11';
mouse=7; 

% run cvPCA with shuffling
cvPCA_eigs_mice_shuffle(dataroot, matroot,mouse_tag,mouse);

% plot
plot_mice_powerlaw_shuffle_figS5l(matroot, myplotroot,mouse_tag);

%%%%%%%%%%
% fig S6b
%%%%%%%%%%
disp('Making fig S6b');

mouse_tag='M170714_MP032_2017-08-07';
mouse=4; 

% run cvPCA with shuffling
cvPCA_eigs_mice_shuffle_redCells(dataroot, matroot,mouse_tag,mouse);

% plot
plot_mice_powerlaw_shuffle_figS6b(matroot, myplotroot,mouse_tag);

disp('Done');


