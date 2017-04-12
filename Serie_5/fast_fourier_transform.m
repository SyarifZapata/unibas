function beta = fast_fourier_transform(y,n) 
    if n == 2 
        beta = [1 1;1 -1]*y;
    else
        n = n/2;
        c = fast_fourier_transform(y(1:2:2*n-1,1),n);
        d = fast_fourier_transform(y(2:2:2*n,1),n);
        
       for k = 1:n
           d(k) = d(k)* exp(pi*1i*(k-1)/n);
       end
       
       gamma = [c+d; c-d];
       %gamma(1:n) = c + d;
       %gamma(n:2*n-1) = c-d;
       beta = conj(gamma)/n;
    end
    

end