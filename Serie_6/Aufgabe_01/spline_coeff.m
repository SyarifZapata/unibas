function K = spline_coeff(x,y)
%length of the input points 
n = length(x);

h = diff(x);

%f is the "dividerten differenzen" 
f = diff(y)./h;



%M = zeros(n+1);
M0 = [2 2*((h(1:n-2).^-1) + (h(2:n-1).^-1)) 2]; %Main Diagonal 
M1 = [(h(1:n-2).^-1) 1]; % under main diagonal 
M2 = [1 (h(2:n-1).^-1)]; %above the main diagonal


M = diag(M1, -1); %put the values of M1 UNDER the main diagonal(-1)
M = M + diag(M2, 1); %put the values of M2 ABOVE the main diagonal(-1)
M = M + diag(M0); %put M0 in the main diagonal 

% vector d defined as in exercise sheet
d = [3*f(1); 3*((f(1:n-2)/h(1:n-2)) + (f(2:n-1)/h(2:n-1))); 3*f(n-1)];

p = M\d; %Backslash denotes left matrix division. p=M\d is a solution to M*p=d.


A = y(1:n-1);

B = f;

C= (p(2:n) - f) ./ h.^2;
D = (p(1:n-1) - f) ./ h.^2;


K = [A B C D];


end