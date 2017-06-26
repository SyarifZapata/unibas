function [ V ] = create_velocities( N )

V = -0.5*ones(N,2) + rand(N,2);

V = [V(:,1); V(:,2)];


end

