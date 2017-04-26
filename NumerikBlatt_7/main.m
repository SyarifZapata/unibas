%% Adaptiv Newton Polynominterpolation 
%
% Student name: M. Syarif Hidayatullah
%
% Tutor: Ilja Kalmykov
%
% Exercise sheet 5

[x, N] = adaptDivDiff(@(x) 1./(25*x.^2+1), -1, 1, 127);