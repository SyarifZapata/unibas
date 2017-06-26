function [ X ] = create_points( N )

X = 12*rand(N,2) - 6*ones(N,2);

X = [X(:,1); X(:,2)];
 
end

