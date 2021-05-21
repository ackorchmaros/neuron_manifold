function plot_powerlaw_alpha(matroot,myplotroot,segre_case)

load(fullfile(matroot,sprintf('eigs_%s.mat',segre_case)));% specSpi

specS=sort(specS,1,'descend'); %order wrt the variance
close;

loglog(specS,'linewidth',.5,'color','g')
hold on
xlim([0 size(specS,1)]);
ylabel('Variance','fontsize',40);
%powerlaw
lPCA=ceil(10/2800*size(specS,1));
rPCA=floor(500/2800*size(specS,1));
[p,ypred]=get_powerlaw(specS,lPCA:rPCA);
plot(ypred,'b');
text(200, 0.005, sprintf('\\alpha=%2.2f', p),'fontweight','bold','fontsize',15,...
    'fontangle','normal','color','b') % tune the first 2 parameters to add alpha on the plot
box off;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
grid on;
grid minor;
grid minor;
axis square;

print(fullfile(sprintf('%s/',myplotroot),'fig10a.pdf'),'-dpdf','-fillpage');

