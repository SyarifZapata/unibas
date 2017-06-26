%Aufgabe 9.2

f = @(x) exp(-x.^2);
a = 0;
b = 1;
h = @(i) 3.^-i;

e38 = @(i) abs(quad_38(f,a,b,h(i+1)')-quad_38(f,a,b,h(i+1)'));

i = 1;

while e38(1:i) > (10^-12)
    i = i+1;
end

loglog(e38(1:i), h(1:i))
legend('abs. Fehler')


