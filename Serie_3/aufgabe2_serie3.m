%% Aufgabe 2

clc;
clear;

load A.txt
A= spconvert(A);
load b.txt

%%

AFull= full(A);
length = length(AFull)

%%
tic;
[L,R,P]=gaussGAXPY(AFull);
toc

%%
tic;
LChol = cholesky(AFull);
toc;

%%
y = forward_sub_standard(L,b);
x = backward_sub_standard(R,y);

%%
ychol = forward_sub_standard(LChol,b);
xchol = backward_sub_standard(LChol',ychol);

%%
xm =AFull\b;
error = norm(xm -x);
errChol = norm(xm -xchol);

%%
spy(AFull)
subplot(3, 3,1)
spy(L)
subplot(3, 3,2)
spy(R)
subplot(3, 3,3)
spy(P)
subplot(3, 3,4)
spy(LChol)
subplot(3, 3,5)

%%
