function QS = quad_simpson(f,a,b,n)
if numel(f)>1 % If the input provided is a vector
    n=numel(f)-1; h=(b-a)/n;
    QS= h/3*(f(1)+2*sum(f(3:2:end-2))+4*sum(f(2:2:end))+f(end));
else % If the input provided is an anonymous function
    h=(b-a)/n; xi=a:h:b;
    QS= h/3*(f(xi(1))+2*sum(f(xi(3:2:end-2)))+4*sum(f(xi(2:2:end)))+f(xi(end)));
end