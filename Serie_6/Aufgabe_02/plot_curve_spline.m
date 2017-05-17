clear
close all

load Points.dat

x = Points(:, 1);
y = Points(:, 2);
n = length(x); % Anzahl der Punkte

% Berechne hier die Stuetzstellen t_k(1),t_k(2),...,t_k(n)
% k startet from 1 therefore you dont have to change the index. 
tk = zeros(n,1);
tk(1) = 0;  % defined in excercise sheet
for k = 2:n
    tk(k) = tk(k-1) + sqrt((x(k)-x(k-1)).^2+(y(k)-y(k-1)).^2);
end

% Bestimme hier die Werte t
t = (tk(1):0.1:tk(n))'; %increment 0.1 

% Bestimme die Splines s_x und s_y
s_x = spline(tk,x,t);
s_y = spline(tk,y,t);

% Zeichne hier die Kurve
plot(s_x, s_y)
