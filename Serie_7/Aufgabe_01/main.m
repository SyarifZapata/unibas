%Hauptprogramm Aufgabe 1

load Pts.txt
[x1,x2] = meshgrid(0:10,0:10);
s = spline_2D(x1,x2,Pts)

figure
surf(x1,x2,s)


[x1,x2] = meshgrid(0:0.1:10,0:0.1:10);
s = spline_2D(x1,x2,Pts)

figure
surf(x1,x2,s)
