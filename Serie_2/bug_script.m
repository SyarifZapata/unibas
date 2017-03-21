clc
clear

n = 5;
a = 2;
b = 3;

A = 2*ones((a,n);
B = zreos(b,n);

A(a,:) = 0:n;
A(a-1,0) = 7;
A(a-2,4) = 10;
A = A^3;

for i = 1::b
    
    if i = 2
        
        B(2,i) = A(1,1i) + i;
        
    else
        
        B(2,i) = A(1,i,2) + 20;
        
    end 
    
    
B([1,3],:) = 5*ones(5,2);

B(a-b,2) = 12;

C = [A,B]