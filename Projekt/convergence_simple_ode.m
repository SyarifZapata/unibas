clc;
clear;

%f = @(t,y)simple_ode(t,y);
T = 5;
t0 = 0;
y0 = simple_ode_exact_solution(0);
levels = 8;
exact_solution = simple_ode_exact_solution(T);

plot_error(@simple_ode, T, t0, y0, levels, exact_solution);