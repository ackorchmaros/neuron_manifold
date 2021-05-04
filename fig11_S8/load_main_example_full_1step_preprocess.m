clear all;

% !!!!!! update mainpath 
mainpath = 'Desktop/neuron_manifold';
% where data is stored 
dataroot = sprintf('%s/data', mainpath); 

% our default mouse parameters
mouse_tag=4;
mouse='M170714_MP032_2017-08-07'; 
K=1; % type of data:natimag2800

%% LOAD DATA FULL PREPROCESS
load(fullfile(dataroot,'dbstims.mat')); %stimset
load(fullfile(dataroot,sprintf('%s_proc.mat',stimset{K})));% respAll
signal = double(respAll{mouse_tag});

save(fullfile(dataroot,sprintf('clean_signal_%s.mat',mouse)), 'signal');

%% LOAD DATA 1st STEP PREPROCESS
k=4;
iexp = find(stype==K);
fname = fullfile(dataroot, sprintf('%s_%s_%s.mat', stimset{K},...
    dbstims(iexp(k)).mouse_name, dbstims(iexp(k)).date));
% load data
dat = load(fname);

% discard responses from red cells (GAD+ neurons)
stim = dat.stim;
if isfield(dat.stat,'redcell')
    stim = dat.stim;
    stim.resp = stim.resp(:, ~[dat.stat.redcell]);
    stim.spont = stim.spont(:, ~[dat.stat.redcell]);
    sum(~[dat.stat.redcell])
else
    stim = dat.stim;
end

save(fullfile(dataroot,sprintf('clean_redCells_signal_%s.mat',mouse)), 'stim');