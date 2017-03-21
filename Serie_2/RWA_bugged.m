function [x,u] = RWA_bugged(n,f_handle)

    h = 1/n;

    x = (1:n)*h;

    f = h*f_handle(x);

    f(1) = 0;
    f(n) = 0;

    A = spdiags([ones(n,1), ones(n,1), -2*ones(n,1)], -1:1, n, n);

    A(1,2) = 1;
    A(2,1) = 0;

    A(n,n) = 1;
    A(n,n-1) = 0;
    
    u = A\f;

end