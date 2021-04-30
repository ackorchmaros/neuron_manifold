% author: Kaie Kubjas
function [signal_var, noise_var] = variances(X1,X2)
[X1_U,X1_D,~] = svd(X1);
d = diag(X1_D);
D_inv = diag(d.^-1);
D_inv(1,size(X1_D,2))=0;
  % cross-validated projections
  X1_proj = X1*transpose(X1)*X1_U*D_inv;
  X2_proj = X2*transpose(X1)*X1_U*D_inv;
  % signal, total and noise variances
  nstim = size(X1,1);
  signal_var = 1/nstim.*sum(X1_proj.*X2_proj,1);
  total_var = 1/2.*(1/nstim.*(sum(X1_proj.*X1_proj,1)+sum(X2_proj.*X2_proj,1)));
  noise_var = total_var - signal_var;
end