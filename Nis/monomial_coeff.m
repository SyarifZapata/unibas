function [a] = monomial_coeff(x,y)

%x = [-2 -1 1 2];
%y = [84 18 -12 -72];

%Vandermode
%https://ch.mathworks.com/help/matlab/ref/polyfit.html#bufp1lw-5

    x = x';
    n = length(x);
    V = ones(n);
    V = V.*x;
    V(:,n)=1;
    for a = 1:n-1
       V(:,a) = V(:,a).^(n-a);
    end
    
    a = V\y';
    a = a';
    a = fliplr(a);
end