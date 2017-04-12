function beta = fast_fourier_transform(y,n)

    for l = 1:n
        temp = 0;
        for m = 1:n
            temp = temp + y(m).* exp((2*pi)/n)^((m-1).*l);
        end
        beta(l) = temp;
    end
end