%% Gauss Algorithm 
%
%
%
% Student name: M. Syarif Hidayatullah
%
% Tutor: Ilja Kalmykov
%
% Exercise sheet 2
%
%
%
% Performance test of Gauss-Rank1 Algorithm
%%
A = toeplitz(3*666:-1:1);
B = A;

tic;
B = gaussRank1(B); 
toc

L = eye(size(B)) + tril(B, -1);
U = triu(B);

norm(A - L*U)