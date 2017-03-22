function [x,u] = RWA_bugged(n,f_handle)

    h = 1/n;        

    x = (0:n)*h; % xi = i*h for i = 0,1,...,n (not 1:n)

    f = (h.^2)*f_handle(x); % it was h*f_handle.. the right formula was h^2

    f(1) = 0; % it was f(0) which is wrong the index
    f(n+1) = 0; 

    A = spdiags([-1*ones(n+1,1),  2*ones(n+1,1),-1*ones(n+1,1)], -1:1, n+1, n+1); % Indices were wrong

    A(1,1) = 1;
    A(1,2) = 0;

    A(n+1,n+1) = 1;
    A(n+1,n) = 0;
    
    u = A\f'; % f muss be a vertical vector therefore f' important left division. since
                % we wanted A to be divided by h^2 before multiply by
                % f_handle.

end