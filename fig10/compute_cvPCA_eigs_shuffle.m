% permute columns with different permution between repeats
function compute_cvPCA_eigs_shuffle(dataroot, matroot,segre_case)

% load data
load(fullfile(dataroot,sprintf('%s_repeat1.mat',segre_case))); % repeat1
load(fullfile(dataroot,sprintf('%s_repeat2.mat',segre_case))); % repeat2 

% save repeats in a 3d-array
A=cat(3,repeat1,repeat2);
[m, n] = size(A(:,:,1));
K=1;
A_repeat1=A(:,:,1);
A_repeat2=A(:,:,2);

for k = 1:20
     %shuffle columns using a different permutation for each row 
    rng(k,'twister') % seed
    [~, idx] = sort(rand(m,n));
	A_shuffle_repeat1= A_repeat1(sub2ind([m, n], idx, ones(m,1)*(1:n)));
    A_shuffle(:,:,1)=A_shuffle_repeat1;
    
    [~, idx] = sort(rand(m,n));
	A_shuffle_repeat2= A_repeat2(sub2ind([m, n], idx, ones(m,1)*(1:n)));
    A_shuffle(:,:,2)=A_shuffle_repeat2;
    
    % cross-validated PCA computation
    nshuff = 10;
    ss0 = cvPCA(A_shuffle, nshuff);
    ss  = nanmean(ss0,2); 
    ss  = ss(:) / sum(ss);

    specSpi{K}{k} = ss;

end
save(fullfile(matroot,sprintf('eigs_shuffle_%s.mat',segre_case)), 'specSpi')
 