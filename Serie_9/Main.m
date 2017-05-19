clc;

f=@(x) (2./(x.^2-((2.*sqrt(3)).*x) +4));
a = 2;
b = 1 + sqrt(3);
eS = zeros(12,1);
h = zeros(12,1);
i = 1:12;
h =  (2.^(-i)).*(sqrt(3)-1)

for i = 1:12
    
   QS=quad_simpson(f,a,b,h(i))
   eS(i) = abs(pi/3 - QS);
   
end


loglog(h,eS)
