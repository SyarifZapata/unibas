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
        if i ~=1
            sum = 0;
            for k = 1:i-1
                sum = sum + (A(i,k).^2);
            end
            if sum <0
                warning('Not a positive-definite matrix')
                A = zeros(n);
                return 
            end
        % s1 = symsum(A(i,k).^2, k, 1,i-1);
        else
            sum = 0;
        end
        A(i,i) = sqrt(A(i,i)-sum);
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