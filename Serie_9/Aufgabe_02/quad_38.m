function Q38 = quad_38(f,a,b,h)

%h = (b-a)/N; Beilage
%N = 2*M Beilage 

n = length(h);
N = (b-a)./h(1:n);
M = N./3;

Q38 = zeros(n,1);

%Fragen ob length oder size besser
for i = 1:n
    
Q38(i) = (3.*h(i)./8).*(f(a) + 2 .* sum(f(a+3.*(1:M(i)-1).*h(i))) + 3.*sum(f(a+(3.*(0:M(i)-1).*h(i))) + f(a+(3.*(0:M(i)-1)+2).*h(i))) +f(b));

end



end