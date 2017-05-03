function K = spline_coeff(x,y)

n = length(x);

f = diff(y)./diff(x);


h = diff(x);

M = zeros(n+1);
M0 = [2 2*((h(1:n-2).^-1) + (h(2:n-1).^-1)) 2];
M1 = [(h(1:n-2).^-1) 1];
M2 = [1 (h(2:n-1).^-1)];


M = diag(M1, -1);
M = M + diag(M2, 1);
M = M + diag(M0);

d = [3*f(1); 3*((f(1:n-2)/h(1:n-2)) + (f(2:n-1)/h(2:n-1))); 3*f(n-1)];

p = M\d;



A = y(1:n-1);

B = f;

C= (p(2:n) - f) ./ h.^2;
D = (p(1:n-1) - f) ./ h.^2;


K = [A B C D];


end