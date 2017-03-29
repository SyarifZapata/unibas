%% Aufgabe 2

clc;
clear;
close all;

load A.txt
A= spconvert(A);
load b.txt

%%

AFull= full(A);
length = length(AFull)
size(A)
%%
tic;
[L,R,P]=gaussGAXPY(AFull);
toc

%%
tic;
LChol = cholesky(AFull);
toc

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
subplot(3, 3,1)
spy(AFull)

subplot(3, 3,2)
spy(L)

subplot(3, 3,3)
spy(R)

subplot(3, 3,4)
spy(P)

subplot(3, 3,5)
spy(tril(LChol))



%%
