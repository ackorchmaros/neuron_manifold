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

%% FIGURE S2

%%%%%%%%%%%
% fig S2a
%%%%%%%%%%%
%inputs
segre_case='100ambient_30sample_19segre';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,segre_case);

% plot
plot_powerlaw_noAlpha(matroot,myplotroot,segre_case);
close;

%%%%%%%%%%%
% fig S2b
%%%%%%%%%%%
%inputs
segre_case='100ambient_300sample_19segre';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,segre_case);

% plot
plot_powerlaw_noAlpha(matroot,myplotroot,segre_case);
close;

%%%%%%%%%%%
% fig S2c
%%%%%%%%%%%
%inputs
segre_case='100ambient_3000sample_19segre';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,segre_case);

% plot
plot_powerlaw_noAlpha(matroot,myplotroot,segre_case);
close;

%%%%%%%%%%%
% fig S2d
%%%%%%%%%%%
%inputs
segre_case='70ambient_30sample_19segre';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,segre_case);

% plot
plot_powerlaw_noAlpha(matroot,myplotroot,segre_case);
close;

%%%%%%%%%%%
% fig S2e
%%%%%%%%%%%
%inputs
segre_case='70ambient_300sample_19segre';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,segre_case);

% plot
plot_powerlaw_noAlpha(matroot,myplotroot,segre_case);
close;

%%%%%%%%%%%
% fig S2f
%%%%%%%%%%%
%inputs
segre_case='70ambient_3000sample_19segre';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,segre_case);

% plot
plot_powerlaw_noAlpha(matroot,myplotroot,segre_case);
close;

%%%%%%%%%%%
% fig S2g
%%%%%%%%%%%
%inputs
segre_case='40ambient_30sample_19segre';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,segre_case);

% plot
plot_powerlaw_noAlpha(matroot,myplotroot,segre_case);
close;

%%%%%%%%%%%
% fig S2h
%%%%%%%%%%%
%inputs
segre_case='40ambient_300sample_19segre';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,segre_case);

% plot
plot_powerlaw_noAlpha(matroot,myplotroot,segre_case);
close;

%%%%%%%%%%%
% fig S2i
%%%%%%%%%%%
%inputs
segre_case='40ambient_3000sample_19segre';

% compute cvPCA variances 
compute_cvPCA_eigs(dataroot, matroot,segre_case);

% plot
plot_powerlaw_noAlpha(matroot,myplotroot,segre_case);
close;

disp('Done');