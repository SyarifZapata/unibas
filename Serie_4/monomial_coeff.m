function a = monomial_coeff(x,y)
    
    n = length(x);
    x = x';
    y = y';
    A = ones(n);
    A = A.*x;
    A(:,n)=1;
    for i = 1:n-1
       A(:,i) = A(:,i).^(n-i); % [a^3,a^2,a^1,a^0]
    end
    
    a = A\y;
    a = a';
    a = fliplr(a);
end