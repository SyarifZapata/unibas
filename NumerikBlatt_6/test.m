%% Newton Polynominterpolation 
%
% Student name: M. Syarif Hidayatullah
%
% Tutor: Ilja Kalmykov
%
% Exercise sheet 5

%% 
%
%
%
%

x = [-1.5; -1; 0; 1; 0; -1; 0; 1; 0; -1; 0; 1; 0; -1; -1.5];
y = [0; 0; -1; 0; 1; 0; -1; 0; 1; 0; -1; 0; 1; 0; 0];
z = [-6; -6; -5; -4; -3; -2; -1; 0; 1; 2; 3; 4; 5; 6; 6]./6;


t=x-x;
n=size(t);

for i=1:n-1
t(i+1) = t(i) +(x(i+1)-x(i)).^2 +(y(i+1)-y(i)).^2 +(z(i+1)-z(i)).^2;
end
Nx = divDiff(t, x);  Ny = divDiff(t, y);  Nz = divDiff(t, z);
     tp = linspace(t(1), t(end), 666);
     xp = hornerNewton(Nx, t, tp);
     yp = hornerNewton(Ny, t, tp);
     zp = hornerNewton(Nz, t, tp);
     plot3(x, y, z, 'ks', xp, yp, zp, 'r-');
     axis equal;  view(-35, 40);  axis([-1.6, 1.1, -1.1, 1.1, -1.1, 1.1]);
