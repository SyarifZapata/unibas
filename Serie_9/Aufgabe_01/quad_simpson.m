function QS = quad_simpson(f,a,b,h)

%h = (b-a)/N; Beilage
%N = 2*M Beilage 

n = length(h);
N = (b-a)./h(1:n);
M = N(1:12)./2;

QS = zeros(12,1);

%Fragen ob length oder size besser
for i = 1:12
    
    QS(i) = (h(i)./3).*(f(a) + 2 * sum(f(a+2.*(1:(M(i)-1))*h(i))) + 4.*sum(f(a+(2.*(0:M(i)-1).*h(i))))+ f(b));
end


    
   



end