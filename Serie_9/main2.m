clc; clear all
%Aufgabe 9.2

f = @(x) exp(-x.^2);
a = 0;
b = 1;

h = @(i) 3.^-i;

i=1;
Q38 = quad_38(f,a,b,h(i));

e38=1;

while e38 >= 10^-12
    i=i+1;
    old = Q38;
    Q38 = quad_38(f,a,b,h(i));
    e38 = abs(old - Q38);
end

i
    





