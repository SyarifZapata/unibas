function [p] = monomial_interpol(a,x,z)
%input a0, a1, a2, a3
% warum wird x uebergeben??
% a = 2 -7 1 -8
    n = length(a);
    m = length(z);
    p = ones(1,m);%"leeres array für ausgabe"
    for i = 1:m%iteriere fuer jedes z
        b = a(1);
        for j = 2:n
            b = b+a(j)*z(i)^(j-1);
        end
        p(i)= b;
    end
    
end