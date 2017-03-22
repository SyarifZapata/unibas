function x = solve_lr_pivot( A,b )
    [L,R,P] = gaussGAXPY(A);
    y = forward_sub_standard(L,P*b);
    x = backward_sub_standard(R, y);
end