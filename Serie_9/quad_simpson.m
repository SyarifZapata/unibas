function QS = quad_simpson(f,a,b,h)
N = (b-a)/h;
M = N./2;
k0 = 0:M-1;
k1 = 1: M-1;


sum1 = sum(f(a+2.*k1.*h));
sum2 = sum(f(a+(2.*k0+1).*h));

QS= (h./3).* (f(a) + 2.*sum1 + 4.*sum2 + f(b));

end


