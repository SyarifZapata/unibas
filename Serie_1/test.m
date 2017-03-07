A=[1 2 1;2 2 3;3 5 4]
b=[4;2;5]

[L,R]=lr_band(A,2,2)
y=forward_sub(L,b,2)
x=backward_sub(R,y,2)