function z = newton(f, df, z)



    for k = 1:50
        z = z - f(z)./df(z);
    end
    

        
    
end