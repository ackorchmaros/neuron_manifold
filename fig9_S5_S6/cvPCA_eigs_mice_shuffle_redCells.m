
% permute rows/stimuli using different permutations across repeats 
% and different permutations for each column/neuron
% only 1 mouse 
% data after 1st step of preproccesing
function cvPCA_eigs_mice_shuffle_redCells(dataroot, matroot,mouse_tag,mouse)

% load data
load(fullfile(dataroot,'dbstims.mat'));% stimset !!! check it is in your data folder otherwise download it from figshare 
K=1;
load(fullfile(dataroot,sprintf('%s_redCells_proc.mat',stimset{K}))); % respAll, ie output of preproccessing step

A = double(respAll{mouse});
[m, n] = size(A(:,:,1));
A_repeat1=A(:,:,1);
A_repeat2=A(:,:,2);

% permute rows/stimuli of A_repeat1 and A_repeat2
for k = 1:20 %number of permutations
    
    % choose seeds different per repeat, permutation and mouse
    rng(k+mouse*8,'twister') % seed for A_repeat1
    [~, idx] = sort(rand(m,n));
    % shuffle rows
	A_shuffle_repeat1= A_repeat1(sub2ind([m, n], idx, ones(m,1)*(1:n)));
    A_shuffle(:,:,1)=A_shuffle_repeat1;
    
    rng(k+mouse*80,'twister') % seed for A_repeat2
    [~, idx] = sort(rand(m,n));
	A_shuffle_repeat2= A_repeat2(sub2ind([m, n], idx, ones(m,1)*(1:n)));
    A_shuffle(:,:,2)=A_shuffle_repeat2;
    
     % mean center each neuron's responses
    A_shuffle = A_shuffle - mean(A_shuffle, 1);
     
    % cross-validated cvPCA computation
    nshuff = 10;
    ss0 = cvPCA(A_shuffle, nshuff);
    ss  = nanmean(ss0,2); 
    ss  = ss(:) / sum(ss);

    specSpi{K}{k} = ss; 
end

save(fullfile(matroot,sprintf('eigs_%s_shuffle_redCells.mat',mouse_tag)), 'specSpi')
 