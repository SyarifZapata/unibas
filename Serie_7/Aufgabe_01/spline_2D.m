function s = spline_2D(x1, x2, y)

n = length(y);  %the length of vector y 
m = zeros(n+2); % 
m(2:n+1,2:n+1) = y; % 
y = m;


n = length(y); %

A = zeros(n); %create new matrix of size n
%diag erzeugt auch ein matrix

d1 = ones(1,n-2) * 2/3; %
d2 = ones(1,n-2) * 1/6; %
A = diag([1 d1 1]); %set the main diagonal 
A = A + diag([-2 d2],1); %set the upper diagonal
A = A + diag([d2 -2],-1); %set the lower diagonal
A(n,n-2) = 1; %fill the missing ones
A(1,3) = 1;


alpha = kron(A,A)\y(:); %Kronecker Tensor Product und gleichungen loesen.
alpha = reshape(alpha,[n,n]); % verwandle alpha in eine nxn matrix 

s = zeros(size(x1));
for i = 1:n
    for j = 1:n
        s = s +  alpha(i,j) .* B_3(x1 - (i-2)) .* B_3(x2 - (j-2));
    end
end

end

% b(:) == reshape(b,[],1)