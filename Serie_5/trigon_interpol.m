function q = trigon_interpol(x,a,b,n)
    m = n/2;
    q = (a(1)/2) + (a(m).*cos(m*x)/2);
    for l = 1:m-1
        q = q + a(l)*cos(l*x) + b(l)*sin(l*x)    
    end
         
end