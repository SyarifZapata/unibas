function [f] = simple_ode(t, y)
    f = y + sin(t);
end