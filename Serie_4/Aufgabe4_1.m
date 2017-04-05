%%
x = [-2, -1, 1, 2];
y = [84, 18, -12, -72];

a = monomial_coeff(x,y)

z = [3,4,5,6];

p = monomial_interpol(a,x,z)
