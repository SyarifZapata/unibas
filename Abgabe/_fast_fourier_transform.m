function [beta] = fast_fourier_transform(y,n)
% https://en.wikipedia.org/wiki/DFT_matrix
    if n==2
        beta = [1 1;1 -1]*y;
    else
        n = n/2;
        Tn= dftmtx(n);
        %erstens
        %y = y';
        %n
        %sizeTn = size(Tn)
        %sizeY = size(y)
        c = Tn*y(1:2:2*n-1);%evtl y transformieren zu y'
        d = Tn*y(1:2:2*n);
        fast_fourier_transform(c,n);
        fast_fourier_transform(d,n);
        %zweitens
        for k=1:n
            d(k) = exp(1)^((pi*1i*k-1) / n)*d(k);
        end
        %drittens
        y(1:n) = c+d;
        y(n:2*n-1) = c-d;
        beta = (1/n) * real(y);
    end
end

