clear;
clc;

load X.mat;
load V.mat;

T = 300;
t0 =0;
y0 = [X;V];
delta_t = 0.1;

[y,t] = Euler(@Cucker_Smale_ode,T,t0,y0,delta_t);
animate_point_cloud(y(1:202,:),t);