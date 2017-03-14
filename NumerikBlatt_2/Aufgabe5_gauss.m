%% Gauss Algorithm 
%
% Student name: M. Syarif Hidayatullah
%
% Tutor: Ilja Kalmykov
%
% Exercise sheet 2

%%
A = toeplitz(3*666:-1:1);
B = A;

tic;
B = gauss(B); 
toc

L = eye(size(B)) + tril(B, -1);
U = triu(B);

norm(A - L*U)