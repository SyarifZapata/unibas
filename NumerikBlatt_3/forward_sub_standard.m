function y = forward_sub_standard(L,b)
n=length(b);
y = zeros(n,1);
    for i = 1:n
           y(i)= (b(i) - L(i,:)*y)/L(i,i);
    end
end
