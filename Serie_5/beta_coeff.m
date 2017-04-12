function beta = beta_coeff(y,n)
 beta = zeros(1,length(y));
    m = length(y);
    t = zeros(1,m);
    for l = 1:m
        s = 0;
        for k = 1:m 
            s = s + y(k)*exp(1)^(((2*pi*1i) / n)*-m*l);
        end
        beta = (1/m) * s;
    end
end