function z = newton50(f, df, z1)

z = zeros(50,1);
z(1) = z1;
n = size(z,1);

    
    for k = 2:50
        z(k) = z(k-1) - f(z(k-1))/df(z(k-1));
    end
   
    
end