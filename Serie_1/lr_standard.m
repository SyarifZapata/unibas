function [L,R] = lr_standard(A)
n = size(A);
R = A;
L = eye(n);

for k=1:n-1
    for i = k+1:n
        
            L(i,k) = R(i,k)/R(k,k);
            for j = k+1:n
                R(i,j) = R(i,j)-L(i,k)*R(k,j);
            end
            R(i,k)= 0; % We assigned the value zero to the items under the diagonal
       
        
    end
end
end