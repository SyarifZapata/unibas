function p = lagrange_interpol(x,y,z)

[n, ~] = size(x);
p = 0;

    for j = 1:n %berechne Summe über alle Lagrange-Polynome
        L = 1;
        for k = 1:n %berechne das Produkt eines einzelnen Lagrange-Plynoms
            if k ~= j
                L = L .* (z - x(k))/(x(j) - x(k));
            end
        end
        p = p + y(j)*L;
    end
end