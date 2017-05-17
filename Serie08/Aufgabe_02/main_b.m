%Serie 08 Aufgabe_02.b

%i
f = @(z) z.^6-1;
df = @(z) 6.*z.^5;
h = [0.1, 0.05, 0.01];

for i = 1:length(h)

[x,y] = meshgrid(-2:h(i):2);
z = x + 1i.*y;
z = newton(f, df, z);

figure
surf(x,y,angle(z))
view(2)
shading('flat')
title('h = 0.1')



end



%ii

h = [0.1, 0.05, 0.01, 0.001];

for i = 1:length(h)

[x,y] = meshgrid(-1.5:h(i):-0.7, -1.1:h(i):-0.3);
z = x + 1i*y;
z = newton(f, df, z);
 
figure
surf(x,y,angle(z))
view(2)
shading('flat')
title('h = 0.001')

end



