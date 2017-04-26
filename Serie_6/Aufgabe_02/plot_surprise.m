clear
close all
clc

load PointsSurprise.dat, load NPointsSurprise.dat

X = PointsSurprise(:, 1);
Y = PointsSurprise(:, 2);
N = NPointsSurprise;

counter = 1;

for i = 1 : length(N)
    
    n = N(i);
    x = X(counter : counter + n - 1);
    y = Y(counter : counter + n - 1);
    counter = counter + n;
    
    % Berechne hier die Stuetzstellen t_k(1),t_k(2),...,t_k(n)
    t_k = zeros(n,1);
    for j = 2:n
        t_k(j) = t_k(j-1) + sqrt((x(j)-x(j-1)).^2+(y(j)-y(j-1)).^2);
    end
        
    % Bestimme hier die Werte t
    t = (t_k(1):0.01:t_k(n))';

    % Bestimme die Splines s_x und s_y
    s_x = spline(t_k,x,t);
    s_y = spline(t_k,y,t);


    % Zeichne hier die Kurve
    plot(s_x, s_y)
    hold on;
    
end