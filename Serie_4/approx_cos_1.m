function p_1 = approx_cos_1(z)
    z = mod(z,2*pi);
    x = [0, pi/2, pi, (3*pi)/2, 2*pi];
    y = [1, 0, -1, 0, 1];
    
    if length(z)>1
        a = monomial_coeff(x,y);
        p_1 = monomial_interpol(a,x,z);
    else
    p_1=lagrange_interpol1_param(x,y,z);
    end
end