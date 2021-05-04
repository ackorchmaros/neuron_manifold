% sourse: compileResps.m from https://github.com/stringer-pachitariu-et-al-2018b
function [specS,cproj,specN] = cvPCA(respB0, nsh)

nstims = size(respB0,1);

% correlation matrix between repeats
fullCOV = reshape(permute(respB0,[1 3 2]),[],size(respB0,2)) * ...
    reshape(permute(respB0,[1 3 2]),[],size(respB0,2))'; % permute gives a img x 2 x neurons	reshape gives img*2 x neurons
specS=zeros(nstims, nsh, 'double');

clear respBz;
for ish = 1:nsh
    
    respBz = respB0;
	%(1) choose a permutation pi of image labels and exchange repeats only for the
	% non-fixed points of pi
    inr = rand(size(respB0,1),1) < .5; % sample the stimuli to shuffle
    respBz(inr,:,:) = respB0(inr,:,[2 1]); % exchange repeat 1 with repeat 2 only for sample choosen
    istims1 = Inf*ones(nstims,1);
    istims1(~inr) = find(~inr); 
    istims2 = Inf*ones(nstims,1);
    istims2(inr) = find(inr); 
    
    [~,istims] = sort([istims1; istims2],'ascend'); 
    
    istims = istims(1:nstims); 
    
    %(2) apply pi to the correlation matrix and run svd
    [A, B, ~] = svdecon(fullCOV(istims, istims)); 
    
	clear cproj;
    
    %(3) proj covariance matrix of repeat 1 with eigenvectors div by sqrt eigenvalues 
    cproj(:,:,1) = respBz(:,:,1) * (respBz(:,:,1)' * A / diag(sqrt(diag(B))));
    cproj(:,:,2) = respBz(:,:,2) * (respBz(:,:,1)' * A / diag(sqrt(diag(B))));
    
   %(4) save statistics
    ss = sum(cproj(:,:,1).*cproj(:,:,2), 1); 
	
	totV = sum(cproj(:,:,1).^2) + sum(cproj(:,:,2).^2);
	ns = totV - ss;
	
    specS(:,ish) = ss; % output
	specN(:,ish) = ns; 

end