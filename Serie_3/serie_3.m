clc
clear all
%% Test
A=[1 1 1 1 1;1 2 3 4 5;1 3 6 10 15;1 4 10 20 35;1 5 15 35 70]
result1 = tril(cholesky(A))
test = result1 * result1' -A


%%
B = [121 -110 99 -88;-110 244 -222 200;99 -222 371 -26;-88 200 -26 504]
result2 = tril(cholesky(B))
test2 = result2 * result2' -B


%%
C = [2 1 0 0 0;1 1 1 0 0;0 1 0 1 0; 0 0 1 1 1;0 0 0 1 2]
result3 = cholesky(C)

%% Test 2
T= toeplitz(1000:-1:1);

tic;
[L,R,P]=gaussGAXPY(T);
test4 = norm(L* R-T)
toc

%%
tic;
result5= tril(cholesky(T));
test5 = norm(result5 * result5'-T)

toc

%%
% Cholesky zerlegung is schneller da nur die untere haelfte 
% geprueft wird. Obere haelfte is nicht mehr relevant. 