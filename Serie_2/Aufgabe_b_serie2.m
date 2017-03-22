%% Aufgabe b
A = [0 1;1 0]
b = [2;-4]

%%
x = solve_lr_pivot(A,b)
r = b - A*x

%% 
A1 = [27 -4 24 6;-29 8 -7 8;-16 25 28 -18;4 8 -10 14]
b1 = [326;46;4;184]

%%
x1 = solve_lr_pivot(A1,b1)
r1 = b1 - (A1*x1)