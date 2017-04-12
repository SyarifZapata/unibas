function [x,y] = saegezahn(n)
    
    k = (0:(n-1))';

    x = 2*pi*k/n;
    y = (mod(x,2*pi) < pi).*mod(x,2*pi) - (mod(x,2*pi) >= pi).*(2*pi-mod(x,2*pi));

end

