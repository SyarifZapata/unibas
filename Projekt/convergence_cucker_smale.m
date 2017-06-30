clear;
clc;

T = 10;
t0= 0;
levels= 5;
delta_t=2.^(-9);

% Initialisiere die Position und Geschwindigkeit von 100 Individuen
[X]=create_points(100);
[V]= create_velocities(100);
y0 = [X;V];

tic
[exact_solution,t] = Runge_Kutta4(@Cucker_Smale_ode,T,t0,y0,delta_t);
toc
plot_error(@Cucker_Smale_ode, T, t0, y0, levels, exact_solution(:,end))
%animate_point_cloud(exact_solution,t)
