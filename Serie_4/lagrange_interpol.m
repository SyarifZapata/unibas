function p = lagrange_interpol(x,y,z)
n = length(x);

p= zeros(1,n);
    
    for i = 1:n
       temp = 0; 
        for v = 1 :n
            L =1;
            for j = 1:n
                if j ~= v
                L = L .* (z(i)-x(j))/(x(v)-x(j));  
                
                end
                
            end
            temp = temp + y(v).*L;
        end
        p(i)=temp;
    end
end