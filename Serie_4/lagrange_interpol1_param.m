function p = lagrange_interpol1_param(x,y,z)
n = length(x);
    
       temp = 0; 
        for v = 1 :n
            L =1;
            for j = 1:n
                if j ~= v
                L = L .* (z-x(j))/(x(v)-x(j));  
                
                end
                
            end
            temp = temp + y(v).*L;
        end
        p=temp;
    
end