
function compute_cvPCA_eigs(dataroot, matroot,segre_case)

% save repeats in a 3d-array
load(fullfile(dataroot,sprintf('%s_repeat1.mat',segre_case))); % repeat1
load(fullfile(dataroot,sprintf('%s_repeat2.mat',segre_case))); % repeat2 
A=cat(3,repeat1,repeat2);

% cross-validated cvPCA computation
nshuff = 10;
ss0 = cvPCA(A, nshuff);
ss  = nanmean(ss0,2); 
ss  = ss(:) / sum(ss);

specS = ss; 

save(fullfile(matroot,sprintf('eigs_%s.mat',segre_case)), 'specS')
 