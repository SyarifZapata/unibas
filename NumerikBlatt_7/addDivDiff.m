function[xe, Ne] = addDivDiff(x, N, xi, yi)

n = length(N);

Ne = zeros(n+1,1);
Ne(1) = yi;
xe = [xi;x];

    for i = 1:n         
        Ne(i+1) = (N(i) - Ne(i)) ./ (x(i) - xi); 
    end 

end