function y = rsolveGAXPY(R,y)
n = length(y);
R = triu(R);
    for j = n:-1:2
      y(j) = y(j)/R(j,j);
      y(1:j-1) = y(1:j-1)-y(j).*R(1:j-1,j);
    end
    y(1)=y(1)/R(1,1);
end