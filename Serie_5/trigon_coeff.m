function [a,b] = trigon_coeff(beta,n) 
    m = n/2;
    a(1) = 2*beta(1);
    a(m) = 2*beta(m);
    for l = 2:m-1
        a(l) = real(beta(l)+beta(n));
        b(l) = real(1i*(beta(l)-beta(n-l)));
    end
end