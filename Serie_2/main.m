clear
close all

n = 8;

f_handle = @(x) pi^2*sin(pi*x);

[x_RWA,u_RWA] = RWA_bugged(n,f_handle);
%[x_RWA,u_RWA] = RWA(n,f_handle);

x_sol = linspace(0,1,9);

u_sol = sin(pi*x_sol);

% Wenn die rote und die blaue Linie uebereinstimmen, sollte das Programm korrekt sein!
plot(x_sol,u_sol,'x-',x_RWA,u_RWA,'o-')
legend('exact solution','approximation')
xlabel('Stuetzstellen x_i')
ylabel('u(x)')