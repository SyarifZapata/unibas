function Q38 = quad_38(f,a,b,h)

N = (b-a)/h;
M = N./3;
k0 = 0:M-1;
k1 = 1:M-1;
sum1= sum(f(a+3.*k1.*h));
sum2= sum(f(a+(3.*k0+1).*h)+f(a+(3.*k0+2).*h));
    

Q38= ((3.*h)/8).*(f(a) + 2.*sum1 + 3.*sum2 + f(b));
       
end