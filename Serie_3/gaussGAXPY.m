function [L,R,P] = gaussGAXPY(A)
n = length(A);
p = 1:n;
m=0;
    for j = 1:n-1
%        [~,m] = max(abs(A(j,:)));
        r=0;
        for x=j:n
            if abs(A(x,j))> r
                m=x;
                r=abs(A(x,j));
            end
        end
        if p(m) ~= p(j)
%              temp1 = p(m);
%              p(m)= p(j);
%              p(j)= temp1;
%              
             p([m,j])=p([j,m]);
        
%             for i=1:n
               
                A([m,j],:) = A([j,m],:);
                
%             end
% A([m],:)
        end
         A(j+1:n,j) = A(j+1:n,j)/A(j,j);
         %for k = j+1:n
             A(j+1:n,j+1:n) = A(j+1:n,j+1:n)-(A(j,j+1:n).*A(j+1:n,j));
         %end
    end
    L = eye(n)+ tril(A,-1);
    R = triu(A);
    P = per_mat(p);
    P = P';
end