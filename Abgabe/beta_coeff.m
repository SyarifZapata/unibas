function [ beta ] = beta_coeff( y,n )
    beta = zeros(1,length(y));
    m = length(y);
    t = zeros(1,m);
    for l = 1:m % iteriere ueber y
        %tic;
        s = 0;
        for k = 1:m % summe ueber m (m-1)?
            s = s + y(k)*exp(1)^(((2*pi*1i) / n)*-m*l);
        end
        
        beta = (1/m) * s;
        %t(n) = toc;
    end
    %plot(t)
    %semilogy(t,1:n);
    %semilogy(t);
end