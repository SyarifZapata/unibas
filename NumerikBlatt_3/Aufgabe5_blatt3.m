%% Gaus-GAXPY with column pivoting
%
% Student name: M. Syarif Hidayatullah
%
% Tutor: Ilja Kalmykov
%
% Exercise sheet 3

%%
A = gallery('orthog', 3*666, -2);
b = ones(size(A,1),1); 
xm =A\b;
B = A;
tic;
B = gaussRank1(B);
toc
errnp = norm(xm -rsolveGAXPY(B, lsolveGAXPY(B,b)))

B = A;
tic;
[B,p] = gaussGAXPY(B);
toc
errpp = norm(xm - rsolveGAXPY(B, lsolveGAXPY(B, b(p))))
