clc;
clear all;

f=@(x) ((x-1).*x./2).*((x-1).*x./2);
QS=quad_simpson(f,-1,1,2)