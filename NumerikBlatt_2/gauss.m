%%
function A = gauss(A)
n = size(A);

    for k=1:n-1
        for i = k+1:n
             A(i,k) = A(i,k)/A(k,k);
             for j = k+1:n
                 A(i,j) = A(i,j)-A(i,k)*A(k,j);
             end   
        end
    end
end

%%
