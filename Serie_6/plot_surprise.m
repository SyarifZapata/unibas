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
    ...
        
    % Bestimme hier die Werte t
    t = ...

    % Bestimme die Splines s_x und s_y
    s_x = ...
    s_y = ...

    % Zeichne hier die Kurve
    plot(...)   
    
end