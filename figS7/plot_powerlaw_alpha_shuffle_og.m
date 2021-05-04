function plot_powerlaw_alpha_shuffle_og(matroot,myplotroot,og_case)

load(fullfile(matroot,sprintf('eigs_shuffle_%s.mat',og_case)));% specSpi

Spi = NaN*zeros(numel(specSpi{1}{1}), numel(specSpi{1})); 
for j = 1:length(specSpi{1})
    Spi(1:numel(specSpi{1}{j}), j) = specSpi{1}{j}; 
end
Spi=sort(Spi,1,'descend'); %order wrt the variance

% /------------ averaged permutation ------------------------------
close;
Spi_average=nanmean(Spi,2);
Spi_average=sort(Spi_average,1,'descend'); %order wrt the variance
loglog(Spi_average)
hold on
shadedErrorBar([1:size(Spi,1)]', nanmean(Spi,2), ...
    nanstd(Spi,1,2)/sqrt(size(Spi,2)-1), {'Linewidth', .5, 'Color', 'b'});
xlim([0 size(Spi,1)]);
%powerlaw parameter
lPCA=ceil(10/2800*size(Spi,1));
rPCA=floor(500/2800*size(Spi,1));
if lPCA==0 
    lPCA=1; 
end
    [p,ypred]=get_powerlaw(Spi,lPCA:rPCA);
plot(ypred,'m');
text(100, 0.0007, sprintf('\\alpha=%2.2f', p),'fontweight','bold','fontsize',15,...
    'fontangle','normal','color','m')
box off;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
grid on;
grid minor;
grid minor;
axis square;

print(fullfile(sprintf('%s/',myplotroot),'figS7b.pdf'),'-dpdf','-fillpage');

