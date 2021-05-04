function plot_powerlaw_noAlpha_og(matroot, myplotroot,og_case)

load(fullfile(matroot,sprintf('eigs_%s.mat',og_case))); % specS

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

print(fullfile(myplotroot,sprintf('figS3_%s.pdf',og_case)),'-dpdf','-fillpage');
