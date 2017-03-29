function A = cholesky(A)
n = length(A);
tf = issymmetric(A);
% syms k
    if ~tf
        warning('Matrix is not of symetric kind, no cholesky decomposition possible')
        A = zeros(n);
        return
    end
    
    for i =1:n 
       
            if (A(i,i)-(A(i,1:i-1)* A(i,1:i-1)')) < 0
                warning('Not a positive-definite matrix')
                A = zeros(n);
                return 
            end
        
        A(i,i) = sqrt(A(i,i)-(A(i,1:i-1)* A(i,1:i-1)'));
        %for j = i+1:n
            if i~=1
                sum2 =0;
                for k = 1:i-1
                     sum2 = sum2+(A(i+1:n,k).*A(i,k)); 
                end
            % s2= symsum(A(j,k).*A(i,k),k,1,i-1);
            else
                sum2=0;
            end
            A(i+1:n,i)= (A(i+1:n,i)-sum2)./A(i,i);
        %end
    end
end