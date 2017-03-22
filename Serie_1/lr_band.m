function [L,R] = lr_band(A,p,q)
n = size(A);
R = A;
L = eye(n);

for k=1:n-1
    for i = k+1:min(n,k+q)
        if R(k,k) ~= 0
            L(i,k) = R(i,k)/R(k,k);
            for j = k:min(n,k+p)
                R(i,j) = R(i,j)-L(i,k)*R(k,j);
            end
           % R(i,k)= 0; % We assigned the value zero to the items under the diagonal
        else
            error('LR-Zerlegung existiert nicht');
        end
    end
end
end