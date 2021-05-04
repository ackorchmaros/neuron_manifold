function plot_powerlaw(matroot, myplotroot,segre_case)

load(fullfile(matroot,sprintf('eigs_%s.mat',segre_case))); % specS

specS=sort(specS,1,'descend'); %order wrt the variance

close;
loglog(specS,'linewidth',.5,'color','g')
hold on
xlim([0 size(specS,1)]);
%power law parameter
lPCA=ceil(10/2800*size(specS,1));
rPCA=floor(500/2800*size(specS,1));
[p,ypred]=get_powerlaw(specS,lPCA:rPCA);
plot(ypred,'b');
text(100, 0.0005, sprintf('\\alpha=%2.2f', p),'fontweight','bold','fontsize',15,...
    'fontangle','normal','color','b') % tune the first 2 parameters to add alpha on the plot
box off;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
grid on;
grid minor;
grid minor;
axis square;

print(fullfile(sprintf('%s/',myplotroot),'fig10a.pdf'),'-dpdf','-fillpage');
