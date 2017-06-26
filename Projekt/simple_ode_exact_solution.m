function [y] = simple_ode_exact_solution(t)

    y = ((-1/2) .* cos(t)) - ((1/2) .* sin(t)) + ((1/2) .* exp(t));
      
end