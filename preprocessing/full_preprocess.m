% author: Annachiara Korchmaros
% sourse: compileResps.m from https://github.com/stringer-pachitariu-et-al-2018b

function full_preprocess(dataroot,useGPU)
load(fullfile(dataroot,'dbstims.mat')); % stimset
K=1;
iexp = find(stype==K);
clear respAll;
for k = 1:length(iexp) %k=4 our main example
    fname = fullfile(dataroot, sprintf('%s_%s_%s.mat', stimset{K},...
        dbstims(iexp(k)).mouse_name, dbstims(iexp(k)).date));
    dat = load(fname);
    % discard responses from red cells (GAD+ neurons)
    stim = dat.stim;
    if isfield(dat.stat,'redcell')
        stim = dat.stim;
        stim.resp = stim.resp(:, ~[dat.stat.redcell]);
        stim.spont = stim.spont(:, ~[dat.stat.redcell]);
        %sum(~[dat.stat.redcell])
    else
        stim = dat.stim;
    end
    % subtracts 32 spontaneous components (nPCspont)
    nPCspont = 32;
    keepNAN = 0;% keepNAN is whether or not to keep stimuli that weren't repeated twice (they will be nan's in the matrix, default is 0)
    [respB,wstim] = loadProc2800(stim, nPCspont, keepNAN, useGPU);

    fprintf('%s_%s_%s.mat processed\n', stimset{K},...
        dbstims(iexp(k)).mouse_name, dbstims(iexp(k)).date)
    respAll{k}  = single(respB);
    istimAll{k} = single(wstim);
end
save(fullfile(matroot, sprintf('%s_proc.mat', stimset{K})),'respAll','istimAll');




