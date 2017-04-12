clc
clear
n = 2^5;
[x,y] = saegezahn(n);
beta = fast_fourier_transform(y,n);
[a,b] = trigon_coeff(beta,n);
q = trigon_interpol(x,a,b,n);

%%
tic
beta = beta_coeff(y,n);
t(j) = toc;

%%
semilogy(t)