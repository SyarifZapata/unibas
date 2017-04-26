%Hauptprogramm Aufgabe 1 ci

x = [0; 0.5; 1];
y = [1; -1; 0.5];

K = spline_coeff(x,y)

%cii
s1 = spline_interpol(K,x,0.2)
s2 = spline_interpol(K,x,0.4)
s3 = spline_interpol(K,x,0.6)
s4 = spline_interpol(K,x,0.8)
