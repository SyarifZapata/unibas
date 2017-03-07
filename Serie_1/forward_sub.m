function y = forward_sub(L,b,q)
n=length(b);
y = zeros(n,1);
    for i = 1:n
       y(i)=b(i);
       for j=1:min(i-1,q)
           y(i)= y(i) - L(i,j)*y(j);
       end
       y(i)=y(i)/L(i,i);
    end
end
