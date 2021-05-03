% author: Kaie Kubjas
function dataShuffled = shuffle_data2(data,k)
nSampleNeurons = size(data,2);
nStimuli = size(data,1);
dataShuffled = zeros(nStimuli,nSampleNeurons);

for i=1:nSampleNeurons
    dataShuffled(1:k,i) = data(randperm(k),i);
    dataShuffled(k+1:nStimuli,i) = data(k+1:nStimuli,i);
end
end