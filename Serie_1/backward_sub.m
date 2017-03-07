function x = backward_sub(R,y,p)
n = length(y);
x = zeros(n,1);
    for i = n:-1:1
        x(i)= y(i);
        for j = min(i+p,n):-1:i+1
            x(i)= x(i)-R(i,j)*x(j);
        end
        x(i)=x(i)/R(i,i);
    end
end