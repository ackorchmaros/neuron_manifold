 
function cvPCA_eigs_mice(dataroot, matroot)

load(fullfile(dataroot,'dbstims.mat')); % stimset !!! check it is in your data folder otherwise download it from figshare 
K=1;
load(fullfile(dataroot,sprintf('%s_proc.mat',stimset{K}))); % respAll, ie output of preproccessing step

for k = 1:numel(find(stype==K)) % loop across all mice
    
    A = double(respAll{k});

    % cross-validated cvPCA computation
    nshuff = 10;
    ss0 = cvPCA(A, nshuff);
    ss  = nanmean(ss0,2); 
    ss  = ss(:) / sum(ss);

    specS{K}{k} = ss; 
end

save(fullfile(matroot,'eigs_mice.mat'), 'specS')
 