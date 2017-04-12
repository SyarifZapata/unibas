close all;
clear all;
clc;

load x_k.txt;
load y_k.txt;
load y_orig.txt;

n=2^5;
beta = fast_fourier_transform(y_k,n);
[a,b] = trigon_coeff(beta,n);

beta = fast_fourier_transform(y_orig,n);
[c,d] = trigon_coeff(beta,n);

find(abs(a)>10^-4);
find(abs(b)>10^-4);
find(abs(c)>10^-4);
find(abs(d)>10^-4);

p = trigon_interpol(x_k,a,b,n);
q = trigon_interpol(x_k,c,d,n);

subplot(2,3,1);
plot(x_k,y_k);
title('y-k')

subplot(2,3,2);
plot(x_k,y_orig);
title('y-orig')

subplot(2,3,3);
plot(x_k,p);
title('p')

subplot(2,3,4);
plot(x_k,q);
title('q')

f1 = zeros(1,n);
f2 = zeros(1,n);
for k = 1:n
    f1(k) = abs(y_orig(k)-p(k));
    f2(k) = abs(y_orig(k)-q(k));
end
subplot(2,3,5);
m = length(p);
plot(1:m,p,1:m,q);
title('err')
max(p)
max(q)