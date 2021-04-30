% author: Annachiara Korchmaros
% sourse: compileResps.m from https://github.com/stringer-pachitariu-et-al-2018b

function first_step_preprocess(dataroot)
load(fullfile(dataroot,'dbstims.mat')); % stimset
K=1;
iexp = find(stype==K);
clear respAll;
for k = 1:length(iexp) 
    fname = fullfile(dataroot, sprintf('%s_%s_%s.mat', stimset{K},...
        dbstims(iexp(k)).mouse_name, dbstims(iexp(k)).date));
    % load data
    dat = load(fname);
    % discard responses from red cells (GAD+ neurons)
    stim = dat.stim;
    if isfield(dat.stat,'redcell')
        stim = dat.stim;
        stim.resp = stim.resp(:, ~[dat.stat.redcell]);%
        stim.spont = stim.spont(:, ~[dat.stat.redcell]);
        %sum(~[dat.stat.redcell])
    else
        stim = dat.stim;
    end
   % mean center each neuron's responses
    stim.resp = stim.resp - mean(stim.resp, 1);
    
    % split repeats
    stim_resp_size=size(stim.resp);
    repeat_size=stim_resp_size(1)/2;
    respAll{k}=reshape(stim.resp,[stim_resp_size(1)/2,stim_resp_size(2),2]);
end
save(fullfile(dataroot, sprintf('%s_redCells_proc.mat', stimset{K})),'respAll');




