% author: Kaie Kubjas
function data = SOn_finite_population(nPopulationNeurons, nSampleNeurons, nStimuli)

dataPopulation = zeros(nPopulationNeurons^2,nStimuli);
for i=1:nStimuli
    [Q , ~] = qr(randn(nPopulationNeurons,nPopulationNeurons),0);
    dataPopulation(:,i)=Q(:);
end

coordsSampleNeurons = randsample(nPopulationNeurons^2,nSampleNeurons);
data = dataPopulation(coordsSampleNeurons,:);

end