function [a,b] = trigon_coeff(beta,n)

	m = n/2;

	a = zeros(m+1,1);

	b = zeros(m+1,1);

	a(1) = real(2*beta(1));

	a(m+1) = real(2*beta(m+1));

	a(2:m)= real(beta(2:m)+beta(n:-1:m+2));

	b(2:m)= real(1i*((beta(2:m)-beta(n:-1:m+2))));

end