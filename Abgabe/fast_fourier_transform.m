function gamma= fast_fourier_transform(y,n)

if n == 2

	gamma = [1 1; 1 -1]*y;

else

	n = n/2;
    
    %Tn= dftmtx(n);

	c =fast_fourier_transform(y(1:2:2*n-1),n);

	d =fast_fourier_transform(y(2:2:2*n),n);



	for k =1:n

		d(k) = exp((pi*1i*(k-1))/n)*d(k);

	end

	gamma = zeros(2*n,1);

	gamma(1:n) = c+d;

	gamma(n+1:2*n) = c-d;

end

end