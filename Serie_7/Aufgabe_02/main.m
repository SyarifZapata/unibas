%Hauptprogramm Aufgabe 7.2

f = @(x) 1/(1+25*x.^2);

%Aufgabe 7.2 a)
xk = @(n) -1+2*0:n/n;
p1 = lagrange_interpol(xk(5),f(xk(5)), z);
p2 = lagrange_interpol(xk(10),f(xk(10)), z);
p3 = lagrange_interpol(xk(25),f(xk(25)), z);

x = linspace(-1,1);

figure 
subplot(3,1,1)
plot(x,p1)

subplot(3,1,1)
plot(x,p1)

subplot(3,1,1)
plot(x,p1)



%Aufgabe 7.2 b)
xk = @(n) cos(((2*0:n + 1)/(n + 1)) * (pi/2));
p1 = lagrange_interpol(xk(5),f(xk(5)), z);
p2 = lagrange_interpol(xk(10),f(xk(10)), z);
p3 = lagrange_interpol(xk(25),f(xk(25)), z);

x = linspace(-1,1);

figure 
subplot(3,1,1)
plot(x,p1)

subplot(3,1,1)
plot(x,p1)

subplot(3,1,1)
plot(x,p1)

%Aufgabe 7.2 c)

xk = @(n) -1+2*0:n/n;
K = spline_coeff(xk(5),f(xk(5)));
s1 = spline_interpol(K,xk(5),f(xk(5)));

K = spline_coeff(xk(10),f(xk(10)));
s2 = spline_interpol(K,xk(10),f(xk(10)));

K = spline_coeff(xk(25),f(xk(25)));
s3 = spline_interpol(K,xk(25),f(xk(25)));

x = linspace(-1,1);

figure 
subplot(3,1,1)
plot(x,s1)

subplot(3,1,1)
plot(x,s1)

subplot(3,1,1)
plot(x,s1)


