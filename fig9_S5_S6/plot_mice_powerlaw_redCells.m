function plot_mice_powerlaw_redCells(matroot,myplotroot)

load(fullfile(matroot,'eigs_mice_redCells.mat')); % specS

S = NaN*zeros(2800, numel(specS{1})); 
for j = 1:length(specS{1})
    S(1:numel(specS{1}{j}), j) = specS{1}{j}; 
end
S=sort(S,1,'descend'); %order wrt the variance

%{
   %%% other mice not included in the supplementary
%------------k=1 mouse
close;
k=1; %2366 samples
mouse_tag='M160825_MP027_2016-12-14';
index_nan=isnan(S(:,k));
S_mouse=S(~index_nan,k);
loglog(S_mouse,'linewidth',.5,'color','g')
hold on
%ylim(10.^[-5 -.5])
xlim([0 2800]);
ylabel('Variance','fontsize',30);
set(gca,'ytick', 10.^[-5:0])
set(gca,'xtick', 10.^[0:4])
[p,ypred]=get_powerlaw(S_mouse,10:500);
plot(ypred,'b');
text(5, .1, sprintf('\\alpha=%2.2f', p),'fontweight','bold','fontsize',15,...
    'fontangle','normal','color','b')
box off;
xlabel('PC dimension','fontsize',30);
grid on;
grid minor;
grid minor;
axis square;

print(fullfile(sprintf('%s/%s',myplotroot,mouse_tag),'ordered_eigenvalues_law_redCells.pdf'),'-dpdf','-fillpage');
%------------k=2 mouse
close;
k=2; %samples 2590
mouse_tag='M161025_MP030_2017-05-29';
index_nan=isnan(S(:,k));
S_mouse=S(~index_nan,k);
loglog(S_mouse,'linewidth',.5,'color','g')
hold on
%ylim(10.^[-5 -.5])
xlim([0 2800]);
ylabel('Variance','fontsize',40);
set(gca,'ytick', 10.^[-5:0])
set(gca,'xtick', 10.^[0:4])
[p,ypred]=get_powerlaw(S_mouse,10:500);
plot(ypred,'b');
text(5, .1, sprintf('\\alpha=%2.2f', p),'fontweight','bold','fontsize',15,...
    'fontangle','normal','color','b')
box off;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
grid on;
grid minor;
grid minor;
axis square;

print(fullfile(sprintf('%s/%s',myplotroot,mouse_tag),'ordered_eigenvalues_law_redCells.pdf'),'-dpdf','-fillpage');

%------------k=3 mouse
close;
k=3; % 2800 samples
mouse_tag='M170604_MP031_2017-06-28';
index_nan=isnan(S(:,k));
S_mouse=S(~index_nan,k);
loglog(S_mouse,'linewidth',.5,'color','g')
hold on
%ylim(10.^[-5 -.5])
xlim([0 2800]);
ylabel('Variance','fontsize',40);
set(gca,'ytick', 10.^[-5:0])
set(gca,'xtick', 10.^[0:4])
[p,ypred]=get_powerlaw(S_mouse,10:500);
plot(ypred,'b');
text(5, .1, sprintf('\\alpha=%2.2f', p),'fontweight','bold','fontsize',15,...
    'fontangle','normal','color','b')
box off;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
grid on;
grid minor;
grid minor;
axis square;

print(fullfile(sprintf('%s/%s',myplotroot,mouse_tag),'ordered_eigenvalues_law_redCells.pdf'),'-dpdf','-fillpage');
%}

%------------k=4 mouse, mouse_tag='M170714_MP032_2017-08-07';

close;
k=4; % 2800 samples
index_nan=isnan(S(:,k));
S_mouse=S(~index_nan,k);
loglog(S_mouse,'linewidth',.5,'color','g')
hold on
ylim(10.^[-5 -.5])
xlim([0 2800]);
ylabel('Variance','fontsize',40);
set(gca,'ytick', 10.^[-5:0])
set(gca,'xtick', 10.^[0:4])
[p,ypred]=get_powerlaw(S_mouse,10:500);
plot(ypred,'b');
text(5, .1, sprintf('\\alpha=%2.2f', p),'fontweight','bold','fontsize',15,...
    'fontangle','normal','color','b')
box off;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
grid on;
grid minor;
grid minor;
axis square;

print(fullfile(sprintf('%s/',myplotroot),'figS6a.pdf'),'-dpdf','-fillpage');

%{
%%% other mice not included in the supplementary
%------------k=5 mouse
close;
k=5; % 2800 samples
mouse_tag='M170714_MP032_2017-09-14';
index_nan=isnan(S(:,k));
S_mouse=S(~index_nan,k);
loglog(S_mouse,'linewidth',.5,'color','g')
hold on
ylim(10.^[-5 -.5])
xlim([0 2800]);
ylabel('Variance','fontsize',40);
set(gca,'ytick', 10.^[-5:0])
set(gca,'xtick', 10.^[0:4])
[p,ypred]=get_powerlaw(S_mouse,10:500);
plot(ypred,'b');
text(5, .1, sprintf('\\alpha=%2.2f', p),'fontweight','bold','fontsize',15,...
    'fontangle','normal','color','b')
box off;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
grid on;
grid minor;
grid minor;
axis square;

print(fullfile(sprintf('%s/%s',myplotroot,mouse_tag),'ordered_eigenvalues_law_redCells.pdf'),'-dpdf','-fillpage');
%------------k=6 mouse
close;
k=6; % 2800 samples
mouse_tag='M170717_MP033_2017-08-20';
index_nan=isnan(S(:,k));
S_mouse=S(~index_nan,k);
loglog(S_mouse,'linewidth',.5,'color','g')
hold on
ylim(10.^[-5 -.5])
xlim([0 2800]);
ylabel('Variance','fontsize',40);
set(gca,'ytick', 10.^[-5:0])
set(gca,'xtick', 10.^[0:4])
[p,ypred]=get_powerlaw(S_mouse,10:500);
plot(ypred,'b');
text(5, .1, sprintf('\\alpha=%2.2f', p),'fontweight','bold','fontsize',15,...
    'fontangle','normal','color','b')
box off;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
grid on;
grid minor;
grid minor;
axis square;

print(fullfile(sprintf('%s/%s',myplotroot,mouse_tag),'ordered_eigenvalues_law_redCells.pdf'),'-dpdf','-fillpage');
%------------k=7 mouse
close;
k=7; % 2800 samples
mouse_tag='M170717_MP034_2017-09-11';
index_nan=isnan(S(:,k));
S_mouse=S(~index_nan,k);
loglog(S_mouse,'linewidth',.5,'color','g')
hold on
%ylim(10.^[-5 -.5])
xlim([0 2800]);
ylabel('Variance','fontsize',40);
set(gca,'ytick', 10.^[-5:0])
set(gca,'xtick', 10.^[0:4])
[p,ypred]=get_powerlaw(S_mouse,10:500);
plot(ypred,'b');
text(5, .1, sprintf('\\alpha=%2.2f', p),'fontweight','bold','fontsize',15,...
    'fontangle','normal','color','b')
box off;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
grid on;
grid minor;
grid minor;
axis square;

print(fullfile(sprintf('%s/%s',myplotroot,mouse_tag),'ordered_eigenvalues_law_redCells.pdf'),'-dpdf','-fillpage');
%}
