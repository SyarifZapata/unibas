clear all;
close all;
clc;

x = [-2 -1 1 2];
y = [84 18 -12 -72];

%polyfit(x,y,3)
a = monomial_coeff(x,y);
monomial_interpol(a,x,[3 4 5 6]);

x = [-2 -1 1 2];
y = [1538 911 209 62];
lagrange_interpol(x,y,[3 4 5 6])