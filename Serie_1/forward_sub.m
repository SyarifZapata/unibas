function y = forward_sub(L,b,q)
n=length(b);
y = zeros(n,1);
    for i = 1:n
       y(i)=b(i);
       for j=max(1,i-q):i-1
           y(i)= y(i) - L(i,j)*y(j);
       end
       y(i)=y(i)/L(i,i);
    end
end
