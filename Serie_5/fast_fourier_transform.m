function beta = fast_fourier_transform(y,n) 
    if n == 2 
        beta = [1 1;1 -1]*y;
    else
        n = n/2;
        Tn = zeros(n);
        c = 
        d = 
        
       for k = 1:n
           d(k) = exp((pi.*ik)/n).*d(k);
       end
       
       gamma(1:n) = c + d;
       gamma(n:2*n-1) = c-d;
       beta = conj(gamma)/n;
    end
    

end