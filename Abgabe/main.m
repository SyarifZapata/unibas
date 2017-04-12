close all;
clear all;
clc;

n = 2^5;
[x,y] = saegezahn(n);

beta = fast_fourier_transform(y,n);
[a,b] = trigon_coeff(beta,n);
q = trigon_interpol(x,a,b,n);

plot(q);
figure

t = zeros(1,12);
for j=1:12
    n = 2^j;
    tic
    beta = beta_coeff(y,n);
    t(j) = toc;
end
subplot(1,2,1);
semilogy(t);

t = zeros(1,12);
for j=2:5
    n = 2^j;
    tic
    n
    fast_fourier_transform(y,n);
    t(j) = toc;
end
subplot(1,2,2);
semilogy(t);