clc
clear

n = 2^5;
[x,y] = saegezahn(n);
gamma = fast_fourier_transform(y,n);
beta = 1/n * conj(gamma);
conj(ifft(y,n));
[a,b] = trigon_coeff(beta,n);
q = trigon_interpol(x,a,b,n);

%%
t = zeros(1,12);
for j=1:12
    n = 2^j;
    [x,y]=saegezahn(n);
    tic
    beta = beta_coeff(y,n);
    t(j) = toc;
end

t1 = zeros(1,12);
for j=1:12
    n = 2^j;
    [x,y]=saegezahn(n);
    tic
    gamma = fast_fourier_transform(y,n);
    beta = 1/n * conj(gamma);
    t1(j) = toc;
end
%%
semilogy(1:12,t,1:12,t1,1:12,t1(1)*2.^(1:12),1:12,t1(1)*(2.^(1:12)).^2)
