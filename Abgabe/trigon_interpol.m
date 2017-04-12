function q = trigon_interpol(x,a,b,n)
	
	m = n/2;

	q = zeros(length(x),1);

	for i = 1:length(x)

		q(i) = a(1)/2+a(m+1)/2*cos(m*x(i));

		for k=1:m-1

			q(i) = q(i)+(a(k+1)*cos((k)*x(i))+b(k+1)*sin((k)*x(i)));

		end

	end

end