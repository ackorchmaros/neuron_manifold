% author: Kaie Kubjas
function dataShuffled = shuffle_data(data)
nSampleNeurons = size(data,1);
nStimuli = size(data,2);
dataShuffled = zeros(nSampleNeurons,nStimuli);

for i=1:nSampleNeurons
    dataShuffled(i,:) = data(i,randperm(nStimuli));
end
end