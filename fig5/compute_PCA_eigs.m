% compute PCA
function compute_PCA_eigs(dataroot, matroot,sample_size,variety_case)

% load data
load(fullfile(dataroot,sprintf('%s_%s.mat',sample_size,variety_case))); % x

% compute variances 
x = x - mean(x,1); %demean
fullCOV =x*x';
[~, B, ~] = svdecon(fullCOV);
ss0 = diag(B);
variance= ss0/sum(ss0); % normalize to get percentage of variance


save(fullfile(matroot,sprintf('eigs_%s_%s.mat',sample_size,variety_case)), 'variance')
 