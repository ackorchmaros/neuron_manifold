clear all;

% !!!!!! update mainpath 
mainpath = '~/Desktop/neuron_manifold-main';

% where plots(outputs) are saved
myplotroot=sprintf('%s/fig7_S4/figs', mainpath);
mkdir(myplotroot);

% where other functions are saved
addpath(genpath(sprintf('%s/matlab_functions', mainpath)));
%% FIGURE 7 and S4
% author: Kaie Kubjas, Annachiara Korchamros
disp('Running ..');
%%%%%%%%%%
% Fig 7a
%%%%%%%%%%
rng('default')

% compute variances
s1 = svd(Segre_finite_population(10000, 20000, 3000));
ev_s1 = s1.^2;
sNorm1 = ev_s1/sum(ev_s1); 
s2 = svd(Segre_finite_population(10000, 10000, 3000));
ev_s2 = s2.^2;
sNorm2 = ev_s2/sum(ev_s2);
s3 = svd(Segre_finite_population(10000, 5000, 3000));
ev_s3 = s3.^2;
sNorm3 = ev_s3/sum(ev_s3);
s4 = svd(Segre_finite_population(10000, 3000, 3000));
ev_s4 = s4.^2;
sNorm4 = ev_s4/sum(ev_s4);
s5 = svd(Segre_finite_population(10000, 1000, 3000));
ev_s5 = s5.^2;
sNorm5 = ev_s5/sum(ev_s5);

% plot eliminating 1st variance and until max number of nonzero eigenvalues
close;
plot(sNorm1(2:3000), 'color',[0, 0.4470, 0.7410], 'linewidth',3);
hold on
plot(sNorm2(2:3000), 'color',[0.8500, 0.3250, 0.0980],'linewidth',3); 
hold on
plot(sNorm3(2:3000), 'color',[0.9290, 0.6940, 0.1250],'linewidth',3);  
hold on
plot(sNorm4(2:3000), 'color',[0.4940, 0.1840, 0.5560], 'linewidth',3);
hold on
plot(sNorm5(2:1000), 'color',[0.4660, 0.6740, 0.1880],'linewidth',3); 

box off;
grid on;
grid minor;
grid minor;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
legalpha('20000-dim','10000-dim','5000-dim','3000-dim','1000-dim','location','northeast')
legend boxoff;
axis square;
print(fullfile(myplotroot,sprintf('fig7a.pdf')),'-dpdf','-fillpage');

%%%%%%%%%%
% Fig 7b
%%%%%%%%%%

% compute variances
s1 = svd(shuffle_data(Segre_finite_population(10000, 20000, 3000)));
ev_s1 = s1.^2;
sNorm1 = ev_s1/sum(ev_s1); 
s2 = svd(shuffle_data(Segre_finite_population(10000, 10000, 3000)));
ev_s2 = s2.^2;
sNorm2 = ev_s2/sum(ev_s2); 
s3 = svd(shuffle_data(Segre_finite_population(10000, 5000, 3000)));
ev_s3 = s3.^2;
sNorm3 = ev_s3/sum(ev_s3);
s4 = svd(shuffle_data(Segre_finite_population(10000, 3000, 3000)));
ev_s4 = s4.^2;
sNorm4 = ev_s4/sum(ev_s4);
s5 = svd(shuffle_data(Segre_finite_population(10000, 1000, 3000)));
ev_s5 = s5.^2;
sNorm5 = ev_s5/sum(ev_s5);

% plot eliminating 1st variance and until max number of nonzero eigenvalues
close;
plot(sNorm1(2:3000), 'color',[0, 0.4470, 0.7410], 'linewidth',3);
hold on
plot(sNorm2(2:3000), 'color',[0.8500, 0.3250, 0.0980],'linewidth',3); 
hold on
plot(sNorm3(2:3000), 'color',[0.9290, 0.6940, 0.1250],'linewidth',3);  
hold on
plot(sNorm4(2:3000), 'color',[0.4940, 0.1840, 0.5560], 'linewidth',3);
hold on
plot(sNorm5(2:1000), 'color',[0.4660, 0.6740, 0.1880],'linewidth',3); 

box off;
grid on;
grid minor;
grid minor;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
legalpha('20000-dim','10000-dim','5000-dim','3000-dim','1000-dim','location','northeast')
legend boxoff;
axis square;
print(fullfile(myplotroot,sprintf('fig7b.pdf')),'-dpdf','-fillpage');

%%%%%%%%%%
% Fig S4a
%%%%%%%%%%

rng('default')

% compute variances
s1 = svd(SOn_finite_population(500, 20000, 3000));
ev_s1 = s1.^2;
sNorm1 = ev_s1/sum(ev_s1); 
s2 = svd(SOn_finite_population(500, 10000, 3000));
ev_s2 = s2.^2;
sNorm2 = ev_s2/sum(ev_s2); 
s3 = svd(SOn_finite_population(500, 5000, 3000));
ev_s3 = s3.^2;
sNorm3 = ev_s3/sum(ev_s3);
s4 = svd(SOn_finite_population(500, 3000, 3000));
ev_s4 = s4.^2;
sNorm4 = ev_s4/sum(ev_s4);
s5 = svd(SOn_finite_population(500, 1000, 3000));
ev_s5 = s5.^2;
sNorm5 = ev_s5/sum(ev_s5);

%plot eliminating 1st variance and until max number of nonzero eigenvalues
close;
plot(sNorm1(2:3000), 'color',[0, 0.4470, 0.7410], 'linewidth',3);
hold on
plot(sNorm2(2:3000), 'color',[0.8500, 0.3250, 0.0980],'linewidth',3); 
hold on
plot(sNorm3(2:3000), 'color',[0.9290, 0.6940, 0.1250],'linewidth',3);  
hold on
plot(sNorm4(2:3000), 'color',[0.4940, 0.1840, 0.5560], 'linewidth',3);
hold on
plot(sNorm5(2:1000), 'color',[0.4660, 0.6740, 0.1880],'linewidth',3); 

box off;
grid on;
grid minor;
grid minor;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
legalpha('20000 neurons','10000 neurons','5000 neurons','3000 neurons','1000 neurons','location','northeast')
legend boxoff;
axis square;
print(fullfile(myplotroot,sprintf('figS4a.pdf')),'-dpdf','-fillpage');

%%%%%%%%%%
% Fig S4b
%%%%%%%%%%

s1 = svd(shuffle_data(SOn_finite_population(500, 20000, 3000)));
ev_s1 = s1.^2;
sNorm1 = ev_s1/sum(ev_s1); 
s2 = svd(shuffle_data(SOn_finite_population(500, 10000, 3000)));
ev_s2 = s2.^2;
sNorm2 = ev_s2/sum(ev_s2); 
s3 = svd(shuffle_data(SOn_finite_population(500, 5000, 3000)));
ev_s3 = s3.^2;
sNorm3 = ev_s3/sum(ev_s3);
s4 = svd(shuffle_data(SOn_finite_population(500, 3000, 3000)));
ev_s4 = s4.^2;
sNorm4 = ev_s4/sum(ev_s4);
s5 = svd(shuffle_data(SOn_finite_population(500, 1000, 3000)));
ev_s5 = s5.^2;
sNorm5 = ev_s5/sum(ev_s5);

%plot eliminating 1st variance and until max number of nonzero eigenvalues
close;
plot(sNorm1(2:3000), 'color',[0, 0.4470, 0.7410], 'linewidth',3);
hold on
plot(sNorm2(2:3000), 'color',[0.8500, 0.3250, 0.0980],'linewidth',3); 
hold on
plot(sNorm3(2:3000), 'color',[0.9290, 0.6940, 0.1250],'linewidth',3);  
hold on
plot(sNorm4(2:3000), 'color',[0.4940, 0.1840, 0.5560], 'linewidth',3);
hold on
plot(sNorm5(2:1000), 'color',[0.4660, 0.6740, 0.1880],'linewidth',3); 

box off;
grid on;
grid minor;
grid minor;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
legalpha('20000 neurons','10000 neurons','5000 neurons','3000 neurons','1000 neurons','location','northeast')
legend boxoff;
axis square;
print(fullfile(myplotroot,sprintf('figS4b.pdf')),'-dpdf','-fillpage');

disp('Done');

