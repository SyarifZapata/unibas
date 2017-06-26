%Aufgabe 9.1.a

f = @(x) 2./(x.^2 - 2*sqrt(3)*x + 4);
a = 2;
b = 1 + sqrt(3);
h = @(i) (2.^(-i))*(sqrt(3)-1);
QS = quad_simpson(f,a,b,h(1:12)')

eS = abs(pi/3 - QS(1:12));

figure
loglog(eS, h(1:12), h(1:12), h(1:12).^4, h(1:12), h(1:12).^5)
legend('abs. Fehler', 'Pkt. (hi,hi^4)', 'Pkt. (hi,hi^5)')