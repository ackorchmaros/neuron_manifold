function plots(matroot,myplotroot,sample_case,normal,uniform_cluster1,uniform_cluster2,dimension,sample_size)
close;

%%load data
eigs_normal=load(fullfile(matroot,sprintf('eigs_%s_%s.mat',sample_case,normal))); 
eigs_uniform_cluster1=load(fullfile(matroot,sprintf('eigs_%s_%s.mat',sample_case,uniform_cluster1))); 
eigs_uniform_cluster2=load(fullfile(matroot,sprintf('eigs_%s_%s.mat',sample_case,uniform_cluster2))); 

%variance
var_normal=eigs_normal.variance;
var_uniform_cluster1=eigs_uniform_cluster1.variance;
var_uniform_cluster2=eigs_uniform_cluster2.variance;

% eliminate 1st eingenvalue
sprintf("First singular value of normal: %s",var_normal(1))
var_normal(1)=[];
sprintf("First singular value of uniform 1 cluster: %s",var_uniform_cluster1(1))
var_uniform_cluster1(1)=[];
sprintf("First singular value of uniform 2 cluster: %s",var_uniform_cluster2(1))
var_uniform_cluster2(1)=[];

% plots
x_max=min(size(var_normal,1),10000);
x_axis=(1:x_max)';
plot(x_axis,var_normal, 'color',[0.8500 0.3250 0.0980], 'linewidth',1.5);
hold on
plot(x_axis,var_uniform_cluster1, 'color',[0 0.4470 0.7410],'linewidth',1.5); 
hold on
plot(x_axis,var_uniform_cluster2, 'color',[0.4660 0.6740 0.1880],'linewidth',1.5);  
dimension= str2num(dimension);
if dimension < str2num(sample_size)
    hold on
    xline(dimension, 'color','m','linewidth',1.5 );
end

box off;
grid on;
grid minor;
grid minor;
set(gca,'FontSize',25)
xlabel('PC dimension','fontsize',40);
ylabel('Variance','fontsize',40);
legalpha('normal', 'uniform','bimodal','location','northeast')
legend boxoff;
axis tight;
print(fullfile(myplotroot,sprintf('fig5_%s.pdf',sample_case)),'-dpdf');


