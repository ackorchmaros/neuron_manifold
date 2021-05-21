clear all;

% !!!!!! update mainpath 
mainpath = '~/Desktop/neuron_manifold-main';
% where data is stored 
dataroot = sprintf('%s/data', mainpath); 
% where plots(outputs) are saved
myplotroot=sprintf('%s/fig8/figs', mainpath);
mkdir(myplotroot);
% where other functions are saved
addpath(genpath(sprintf('%s/matlab_functions', mainpath)));

%% FIGURE 8
% author: Kaie Kubjas, Annachiara Korchamros
disp('Running ..');
%%%%%%%%%%%%%%
% load data
%%%%%%%%%%%%%%

% import 1st repeat of mouse data 8122x 2800 (original data)
load(fullfile(sprintf('%s/2repeat_clean_signal_M170714_MP032_2017-08-07.mat',dataroot)));% x
X1 = x(1:2800,:);

% dimensions
nNeurons = size(X1,2);
nStimuli = size(X1,1);

% sample from the multivariate normal distribution taking the covariance
% matrix to be the sample covariance matrix of the original data
S = cov(X1);
e = eig(S);
e = sort(e,'descend');
mu = zeros(1,nNeurons);

rng('default')  
R = mvnrnd(mu,S,nStimuli);

%%%%%%%%%%%
% Fig 8a
%%%%%%%%%%%
% Shuffle a proportion of stimuli for each neuron and compare the eigenvalue plots.

e1 = eig(cov(R));
e1 = sort(e1,'descend');

R2 = shuffle_data2(R,ceil(0.25*nStimuli));
e2 = eig(cov(R2));
e2 = sort(e2,'descend');

R3 = shuffle_data2(R,ceil(0.5*nStimuli));
e3 = eig(cov(R3));
e3 = sort(e3,'descend');

R4 = shuffle_data2(R,ceil(0.75*nStimuli));
e4 = eig(cov(R4));
e4 = sort(e4,'descend');

R5 = shuffle_data2(R,nStimuli);
e5 = eig(cov(R5));
e5 = sort(e5,'descend');

%plot normalized eigenvalues wrt their sum in range [11,500]
close;
min_ev=11;
max_ev=500;
map=brewermap(7,'BuGn');
plot(e(min_ev:max_ev)/sum(e), 'color',map(6,:), 'linewidth',3);
hold on
map=brewermap(7,'BuPu');
plot(e1(min_ev:max_ev)/sum(e1), 'color', map(6,:),'linewidth',3); 
hold on
map=brewermap(9,'YlOrRd');
plot(e2(min_ev:max_ev)/sum(e2), 'color',map(4,:),'linewidth',3);  
hold on
plot(e3(min_ev:max_ev)/sum(e3), 'color',map(5,:), 'linewidth',3);
hold on
plot(e4(min_ev:max_ev)/sum(e4), 'color',map(7,:),'linewidth',3); 
plot(e5(min_ev:max_ev)/sum(e5), 'color',map(9,:),'linewidth',3); 

box off;
grid on;
grid minor;
grid minor;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
axis tight;
legalpha('original data','simulated data','25% shuffled', '50% shuffled', '75% shuffled', '100% shuffled','location','northeast')
legend boxoff;
print(fullfile(myplotroot,sprintf('fig8a.pdf')),'-dpdf','-fillpage');

%%%%%%%%%%%
% Fig 8b
%%%%%%%%%%%
close;

e1 = eig(cov(R));
e1 = sort(e1,'descend');

epsilon=0.75;
idx = eye(nNeurons,nNeurons);
S2 = epsilon*(1-idx).*S + idx.*S;
R2 = mvnrnd(mu,S2,nStimuli);
e2 = eig(cov(R2));
e2 = sort(e2,'descend');

epsilon=0.5;
idx = eye(nNeurons,nNeurons);
S3 = epsilon*(1-idx).*S + idx.*S;
R3 = mvnrnd(mu,S3,nStimuli);
e3 = eig(cov(R3));
e3 = sort(e3,'descend');

epsilon=0.25;
idx = eye(nNeurons,nNeurons);
S4 = epsilon*(1-idx).*S + idx.*S;
R4 = mvnrnd(mu,S4,nStimuli);
e4 = eig(cov(R4));
e4 = sort(e4,'descend');

epsilon=0;
idx = eye(nNeurons,nNeurons);
S5 = epsilon*(1-idx).*S + idx.*S;
R5 = mvnrnd(mu,S5,nStimuli);
e5 = eig(cov(R5));
e5 = sort(e5,'descend');

%plot normalized eigenvalues wrt their sum in range [11,500]
min_ev=11;
max_ev=500;
map=brewermap(7,'BuGn');
plot(e(min_ev:max_ev)/sum(e), 'color',map(6,:), 'linewidth',3);
hold on
map=brewermap(7,'BuPu');
plot(e1(min_ev:max_ev)/sum(e1), 'color', map(6,:),'linewidth',3); 
hold on
map=brewermap(9,'YlGnBu');
plot(e2(min_ev:max_ev)/sum(e2), 'color',map(5,:),'linewidth',3);  
hold on
plot(e3(min_ev:max_ev)/sum(e3), 'color',map(6,:), 'linewidth',3);
hold on
plot(e4(min_ev:max_ev)/sum(e4), 'color',map(7,:),'linewidth',3); 
plot(e5(min_ev:max_ev)/sum(e5), 'color',map(8,:),'linewidth',3); 

box off;
grid on;
grid minor;
grid minor;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
axis tight;
legalpha('original data','simulated data','\epsilon=0.75', '\epsilon=0.5', '\epsilon=0.25', '\epsilon=0','location','northeast')
legend boxoff;
print(fullfile(myplotroot,sprintf('fig8b.pdf')),'-dpdf','-fillpage');
