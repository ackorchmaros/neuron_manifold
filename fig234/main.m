clear all;

% !!!!!! update mainpath 
mainpath = '~/Desktop/neuron_manifold-main';
% where data is stored 
dataroot = sprintf('%s/data', mainpath); 
% where plots(outputs) are saved
myplotroot=sprintf('%s/fig234/figs', mainpath);
mkdir(myplotroot);
% where other functions are saved
addpath(genpath(sprintf('%s/matlab_functions', mainpath)));

%% FIGURES 2-4
% author: Kaie Kubjas, Annachiara Korchamros
%% SIMULATE DATA

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% real data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load(fullfile(sprintf('%s/2repeat_clean_signal_M170714_MP032_2017-08-07.mat',dataroot)));% x

% import the mouse data (here use clean file)
X1 = x(1:2800,:);
X1_ev = sort(eig(cov(X1)),'descend');
X1_ev = X1_ev(1:min(size(X1)));

X2 = x(2801:5600,:);
X2_ev = sort(eig(cov(X2)),'descend');
X2_ev = X2_ev(1:min(size(X2)));

% estimate signal and noise variances
[estimatedSignal_ev,estimatedNoise_ev] = variances(X1,X2);

estimatedSignal_ev = sort(estimatedSignal_ev,'descend');
estimatedSignal_ev = estimatedSignal_ev(1:min(size(X1)));
estimatedNoise_ev = sort(estimatedNoise_ev,'descend');
estimatedNoise_ev = estimatedNoise_ev(1:min(size(X1)));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% simulated data constructed based on real data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng('default')  % For reproducibility
% data dimensions
Nc = size(X2,1);
Ns = size(X1,1);


% construct orthogonal U,V
A = normrnd(0,1,Ns,Nc);
[U,~,V] = svd(A);

% NB! ev=1/Ns*sv^2 
% where ev is the eigenvalue of the covariance matrix and sv is the singular value of the data matrix
% the above construction gives that the estimated cov matrix is the identity matrix

%signal matrix
signal_sv = (Ns*estimatedSignal_ev).^(1/2);
signal_matrix = diag(signal_sv);
signal_matrix(1,Nc)=0;
signal = U*signal_matrix*transpose(V);
signal_ev = sort(eig(cov(signal)),'descend');

%noise matrix
noise_sv = (Ns*estimatedNoise_ev).^(1/2);
noise_matrix = diag(noise_sv);
noise_matrix(1,Nc)=0;

% construct two matrices for cvPCA
A1 = normrnd(0,1,Ns,Nc);
[U1,~,~] = svd(A1);
A2 = normrnd(0,1,Ns,Nc);
[U2,~,~] = svd(A2);
X1s = signal + U1*noise_matrix*transpose(V);
X1s_ev = sort(eig(cov(X1s)),'descend');
X1s_ev = X1s_ev(1:min(size(X1)));
X2s = signal + U2*noise_matrix*transpose(V);
X2s_ev = sort(eig(cov(X2s)),'descend');
X2s_ev = X2s_ev(1:min(size(X1)));
[estimatedSignal2_ev,estimatedNoise2_ev] = variances(X1s,X2s);

estimatedSignal2_ev = sort(estimatedSignal2_ev,'descend');
estimatedSignal2_ev = estimatedSignal2_ev(1:min(size(X1)));
estimatedNoise2_ev = sort(estimatedNoise2_ev,'descend');
estimatedNoise2_ev = estimatedNoise2_ev(1:min(size(X1)));

%% PLOTS
%figure 3a  
close;
edges = linspace(0, 100, 71);
map = brewermap(9,'Set1');
histf(X1s_ev,edges,'facecolor',map(1,:),'edgecolor','r'); %simulated data
hold off;
alpha(.5);
hold on
map = brewermap(5,'Blues');
histf(estimatedSignal2_ev,edges, 'facecolor',map(2,:),'edgecolor','b'); %simulated data signal
hold off;
alpha(.5);
box off;
grid on;
grid minor;
grid minor;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
legalpha('simulated data','simulated data signal','location','northeast')
legend boxoff
axis square;
print(fullfile(myplotroot,sprintf('fig3a.pdf')),'-dpdf','-fillpage');

% figure 3b
close;
edges = linspace(0, 100, 71);
map = brewermap(9,'Set1');
histf(X1_ev,edges,'facecolor',map(1,:),'edgecolor','r'); %original data
hold off;
alpha(.5);
hold on
map = brewermap(5,'Blues');
histf(estimatedSignal_ev,edges, 'facecolor',map(2,:),'edgecolor','b'); %original data signal
hold off;
alpha(.5);
box off;
grid on;
grid minor;
grid minor;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
legalpha('original data','orginal data signal','location','northeast')
legend boxoff
axis square;
print(fullfile(myplotroot,sprintf('fig3b.pdf')),'-dpdf','-fillpage');

%figure 2a
close;
edges = linspace(0, 100, 71);
map = brewermap(9,'Set1');
histf(X1s_ev,edges,'facecolor',map(1,:),'edgecolor','r'); %simulated data
hold off;
alpha(.5);
hold on
map = brewermap(5,'Blues');
histf(estimatedNoise2_ev,edges, 'facecolor',map(2,:),'edgecolor','b'); %simulated data noise 
hold off;
alpha(.5);
box off;
grid on;
grid minor;
grid minor;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
legalpha('simulated data','simulated data noise','location','northeast');
legend boxoff;
axis square;
print(fullfile(myplotroot,sprintf('fig2a.pdf')),'-dpdf','-fillpage');

%figure 2b
close;
edges = linspace(0, 100, 71);
map = brewermap(9,'Set1');
histf(X1_ev,edges,'facecolor',map(1,:),'edgecolor','r'); %original data
hold off;
alpha(.5);
hold on
map = brewermap(5,'Blues');
histf(estimatedNoise_ev,edges,'facecolor',map(2,:),'edgecolor','b'); %original data noise
hold off;
alpha(.5);
box off;
grid on;
grid minor;
grid minor;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
legalpha('original data','orginal data noise','location','northeast')
legend boxoff;
axis square;
print(fullfile(myplotroot,sprintf('fig2b.pdf')),'-dpdf','-fillpage');

%figure 4a 
close;
edges = linspace(0, 100, 71);
map = brewermap(9,'Set1');
histf(estimatedSignal_ev,edges, 'facecolor',map(1,:),'edgecolor','r'); %original data signal
hold off;
alpha(.5);
hold on
map = brewermap(5,'Blues');
histf(estimatedSignal2_ev,edges, 'facecolor',map(2,:),'edgecolor','b'); %simulated data signal
alpha(.5);
box off;
grid on;
grid minor;
grid minor;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
legalpha('orginal data signal', 'simulated data signal','location','northeast')
legend boxoff;
axis square;
print(fullfile(myplotroot,sprintf('fig4a.pdf')),'-dpdf','-fillpage');

%figure4b
close;
edges = linspace(0, 100, 71);
map = brewermap(9,'Set1');
histf(estimatedNoise_ev,edges,'facecolor',map(1,:),'edgecolor','r'); %original data noise
hold off;
alpha(.5);
hold on
map = brewermap(5,'Blues');
histf(estimatedNoise2_ev,edges, 'facecolor',map(2,:),'edgecolor','b'); %simulated data noise 
hold off;
alpha(.5);
box off;
grid on;
grid minor;
grid minor;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
legalpha('orginal data noise', 'simulated data noise','location','northeast')
legend boxoff;
axis square;
print(fullfile(myplotroot,sprintf('fig4b.pdf')),'-dpdf','-fillpage');

disp('Done');