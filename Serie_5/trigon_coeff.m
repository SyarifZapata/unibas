function [a,b] = trigon_coeff(beta,n) 
    m = n/2;
    a=zeros(n,1);
    b=zeros(n,1);
    a(1) = 2*beta(1);
    a(m+1) = 2*beta(m+1);
    for l = 2:m
        a(l) = real(beta(l)+beta(n-l+2));
        b(l) = real(1i*(beta(l)-beta(n-l+2)));
    end