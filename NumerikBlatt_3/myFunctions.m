%%
function [A,p] = gaussGAXPY(A)
n = length(A);
p = 1:n;

m = 0;
    for j = 1:n-1
        r=0;
        for x=j:n
            if abs(A(x,j))> r
                m=x;
                r=abs(A(x,j));
            end
        end
        if p(m) ~= p(j)
             temp1 = p(m);
             p(m)= p(j);
             p(j)= temp1;
        
            for i=1:n
                temp2 = A(m,i);
                A(m,i) = A(j,i);
                A(j,i) = temp2;
            end
        end
         A(j+1:n,j) = A(j+1:n,j)/A(j,j);
         for k = j+1:n
             A(j+1:n,k) = A(j+1:n,k)-(A(j,k).*A(j+1:n,j));
         end

    end
end

%%
function b = lsolveGAXPY(L,b)
n = length(b);
A = eye(n)+ tril(L,-1);
L = A;
    for j = 1:n-1
           b(j+1:n)= b(j+1:n) - b(j).*L(j+1:n,j);
    end
   
end

%%
function y = rsolveGAXPY(R,y)
n = length(y);
R = triu(R);
    for j = n:-1:2
      y(j) = y(j)/R(j,j);
      y(1:j-1) = y(1:j-1)-y(j).*R(1:j-1,j);
    end
    y(1)=y(1)/R(1,1);
end
