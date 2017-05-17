function K = spline_coeff(x,y)
%length of the input points 
n = length(x);

h = diff(x);

%f is the "dividerten differenzen" 
f = diff(y)./h;



%M = zeros(n+1);
Main = [2 2*((h(1:n-2).^-1) + (h(2:n-1).^-1)) 2]; %Main Diagonal 
MBelow = [(h(1:n-2).^-1) 1]; % under main diagonal 
MAbove = [1 (h(2:n-1).^-1)]; %above the main diagonal


M = diag(MBelow, -1); %put the values of M1 UNDER the main diagonal(-1)
M = M + diag(MAbove, 1); %put the values of M2 ABOVE the main diagonal(-1)
M = M + diag(Main); %put M0 in the main diagonal 

% vector d defined as in exercise sheet
d = [3*f(1); 3*((f(1:n-2)/h(1:n-2)) + (f(2:n-1)/h(2:n-1))); 3*f(n-1)];

p = M\d; %Backslash denotes left matrix division. p=M\d is a solution to M*p=d.


A = y(1:n-1);

B = f;

C= (p(2:n) - f) ./ h.^2;
D = (p(1:n-1) - f) ./ h.^2;


K = [A B C D];


end