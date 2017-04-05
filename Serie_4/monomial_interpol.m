function p = monomial_interpol(a,x,z)
    
    n = length(a);
    p = ones(1,n); 
    
    for i = 1 : length(z)
        temp = a(1);
        for j = 2:n
        temp = temp + a(j).*(z(i).^(j-1)); % polynom aufstellen.  
        end
        p(i) = temp;
    end
    
end