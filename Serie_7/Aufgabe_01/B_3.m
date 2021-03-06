function b = B_3(x)

b = x;
ind1 = find(abs(x) <=1);    %k = find(X) returns a vector containing the linear indices of each nonzero element in array X.
ind2 = find(1 < abs(x) & abs(x) <= 2);  %which x belong to which "Koeffizienten"
ind3 = find(abs(x) > 2);

% Finden basis 
% just follow the instruction in beilage 

b(ind1) = 1./6 .* ((2 - abs(x(ind1))).^3 - 4*(1-abs(x(ind1))).^3);


b(ind2) = 1./6 .* ((2-abs(x(ind2))).^3);


b(ind3) = 0;

end