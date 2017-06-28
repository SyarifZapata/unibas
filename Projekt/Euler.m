function [y, t] = Euler(f, T, t0, y0, delta_t)
% f is a function handle
% Intervall a<= t <= b 
% h oder delta_t is gegeben. 
% t0 = a,  t1 = a+h, t2 = a+2h .. tn = T
% (y-y0)/(x-x0) = f in aufgabe 1 =: y'(t) = y(t)+sin(t)
% y1 = y0 + h . f(x0;y0) 
% function handle. f= @(t,y) y+sin(t)

n = (T-t0)/delta_t;
t = zeros(n,1);
y(:,1)= y0+(delta_t .* f(t0,y0));
t(1)= t0+delta_t;
    for i = 2:n
        y(:,i) = y(:,i-1)+(delta_t).*f(t(i-1),y(:,i-1));
        t(i)=t(i-1)+delta_t;
    end
end