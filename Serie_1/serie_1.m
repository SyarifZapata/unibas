%%
A1 = [7 5 0 0;-4 2 0 0;2 -2 3 4;0 1 0 6]
b1 = [-17 0 -23 -26]
p1 = 1; % oberer Bandbreite
q1 = 2; % unterer Bandbreite

%%
tic;
[Ls,Rs] = lr_standard(A1)
toc

%%
tic;
[L,R] = lr_band(A1,p1,q1)
toc

%%
tic;
ys=forward_sub_standard(Ls,b1)
toc
%%
tic;
y=forward_sub(L,b1,q1)
toc
%%
tic;
xs=backward_sub_standard(Rs,y)
toc
%%
tic;
x=backward_sub(R,y,p1)
toc
%%
A2 =[2 0 0 0 1;9 1 0 0 0;0 3 6 0 0;0 0 5 -4 0;0 0 0 2 1]
b2 =[23;89;66;11;17]
p2 =4;
q2 =1;
%%
tic;
[Ls,Rs] = lr_standard(A2)
toc
%%
tic;
[L,R] = lr_band(A2,p2,q2)
toc

%%
tic;
ys=forward_sub_standard(Ls,b2)
toc
%%
tic;
y=forward_sub(L,b2,q2)
toc
%%
tic;
xs=backward_sub_standard(Rs,y)
toc
%%
tic;
x=backward_sub(R,y,p1)
toc
%%
A3 = [0 1;1 0];
[L,R] = lr_standard(A3)