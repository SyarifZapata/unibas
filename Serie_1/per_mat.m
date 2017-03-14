function P = per_mat(p)
n = length(p);
P = zeros(n,n);
    for i = 1:n
           P(p(i),i) = 1;
    end
end