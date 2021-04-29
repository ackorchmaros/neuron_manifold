clear all;

% !!!!!! update mainpath 
mainpath = 'Desktop/neuron_manifold';
% where data is stored 
dataroot = sprintf('%s/data', mainpath); 
%% LOAD DATA
% save mouse response to natimag2800 stimulus

% our default mouse
mouse_tag=4;
mouse='M170714_MP032_2017-08-07'; 

K=1; % type of data:natimag2800

load(fullfile(dataroot,'dbstims.mat')); %stimset
load(fullfile(dataroot,sprintf('%s_proc.mat',stimset{K})));% respAll
signal = double(respAll{mouse_tag});

save(fullfile(dataroot,sprintf('clean_signal_%s.mat',mouse)), 'signal');

disp('Done');