% author: Kaie Kubjas
function data = Segre_finite_population(nPopulationNeurons, nSampleNeurons, nStimuli)
%Segre vectors
v1 = randi([1 100],nPopulationNeurons,nStimuli);
v2 = randi([1 100],nPopulationNeurons,nStimuli);

%grid for the full nPopulationNeurons^2 matrix
[X,Y] = meshgrid(1:nPopulationNeurons,1:nPopulationNeurons);
grid = [X(:) Y(:)];
coordsSampleNeurons = randsample(nPopulationNeurons^2,nSampleNeurons);

data = zeros(nSampleNeurons,nStimuli);

for i=1:nStimuli
    for j = 1:size(coordsSampleNeurons,1)
        coord = grid(coordsSampleNeurons(j),:);
        data(j,i)=v1(coord(1),i)*v2(coord(2),i);
    end
end
end