function [p] = lagrange_interpol(x,y,z)
    n = length(x);
    p = zeros(1,n);%ausgabe zum auffuellen
    for zi = 1:length(z)
        pp = 0;
        for j = 1:n%berechne Summe über alle Lagrange-Polynome
            L=1;
            for k = 1:n%berechne das Produkt eines einzelnes Lagrange-Polynoms
                if k~=j
                    L = L*(zi-x(k))/(x(j)-x(k));
                end
            end
        pp = pp+y (j)*L;
        end
        p(zi) = pp;
    end
end