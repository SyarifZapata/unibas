clear
close all

load Points.dat

x = Points(:, 1);
y = Points(:, 2);
n = length(x); % Anzahl der Punkte

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
