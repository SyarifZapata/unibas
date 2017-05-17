function beta = beta_coeff(y, n)
    w = exp(2 * pi * 1i / n);
    beta = zeros(n, 1);
    
    for l = 0:n - 1   
       temp = 0;
        
       for m = 0:n - 1
           temp = temp + y(m + 1) * (w ^ (-m * l));
       end
       
       beta(l + 1) = temp * (1 / n);       
    end

end