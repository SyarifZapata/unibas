function q = trigon_interpol(x,a,b,n)
    m = n/2;
    q = (a(1)/2) + (a(m+1).*cos(m*x)/2);
    for l = 1:m-1
        q = q + a(l+1)*cos(l*x) + b(l+1)*sin(l*x);    
    end
         
end