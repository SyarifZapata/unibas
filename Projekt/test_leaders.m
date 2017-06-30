clear 
clc 

load X.mat;
%load V.mat;
%X = create_points(100);

T = 300;
t0 = 0;

y0 = X;

delta_t = 0.1;

tic
[y, t] = Euler(@leaders_ode, T, t0, y0, delta_t);
toc

animate_point_cloud(y,t)