clear 
clc 

N = 100;
T = 2;
t0 = 0;
[X] = create_points(N);
%[Y] = create_velocities(N);
%y0 = [X;Y];
y0 = X;
levels = 5;
delta_t = 2.^(-9);

[exact_solution, t] = Euler(@leaders_ode, T, t0, y0, delta_t);
plot_error(@leaders_ode,T,t0,y0,levels,exact_solution(:,end));