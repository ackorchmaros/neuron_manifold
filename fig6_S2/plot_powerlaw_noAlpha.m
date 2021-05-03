function plot_powerlaw_noAlpha(matroot, myplotroot,segre_case)

load(fullfile(matroot,sprintf('eigs_%s.mat',segre_case))); % specS

specS=sort(specS,1,'descend'); %order wrt the variance

close;
loglog(specS,'linewidth',.5,'color','g')
hold on
xlim([0 size(specS,1)]);
set(gca,'FontSize',25)
box off;
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
grid on;
grid minor;
grid minor;
axis square;

print(fullfile(myplotroot,sprintf('fig6_S2_%s.pdf',segre_case)),'-dpdf','-fillpage');
