function plot_mice_powerlaw_shuffle_figS6b(matroot, myplotroot,mouse_tag)

gs=load(fullfile(matroot,sprintf('eigs_%s_shuffle_redCells.mat',mouse_tag)));% specSpi

specSpi=gs.specSpi;
nsamples=size(specSpi{1}{1},1);
Spi = NaN*zeros(nsamples, numel(specSpi{1})); 
for j = 1:length(specSpi{1})
    Spi(1:numel(specSpi{1}{j}), j) = specSpi{1}{j}; 
end
Spi=sort(Spi,1,'descend'); %order wrt the variance

close;
loglog(nanmean(Spi,2),'linewidth', 1, 'Color', 'b')
hold on
shadedErrorBar([1:size(Spi,1)]', nanmean(Spi,2), ...
    nanstd(Spi,1,2)/sqrt(size(Spi,2)-1), {'Linewidth', .5, 'Color', 'b'});
ylim(10.^[-5 -.5])
xlim([0 nsamples]);
ylabel('Variance','fontsize',40);
set(gca,'ytick', 10.^[-5:0])
set(gca,'xtick', 10.^[0:4])
set(gca,'FontSize',25)
[p,ypred]=get_powerlaw(nanmean(Spi,2),10:500);
plot(ypred,'m');
text(19,.05, sprintf('\\alpha=%2.2f', p),'fontweight','bold','fontsize',15,...
    'fontangle','normal','color','m')
box off;
xlabel('PC dimension','fontsize',40);
grid on;
grid minor;
grid minor;
axis square;

print(fullfile(sprintf('%s/',myplotroot),'figS6b.pdf'),'-dpdf','-fillpage');

