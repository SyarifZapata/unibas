clc
clear

n = 5;
a = 2;
b = 3;

A = 2*ones(a,n); % to many opening parenthesis 
B = zeros(b,n); % spelling mistake 

A(a,:) = 0:n-1; % index n ist miss matched. either from 0 to n-1 or 1 to n.  
A(a-1,1) = 7; % column index was 0, probably meant 1. 
A(a-1,4) = 10; % a -2 gives 0, wrong indexing. 
A = A.^3; % A muss be square. change to scalar operator '.^'

for i = 1:b % to many ':'
    
    if i == 2 % should be a boolean statement not assignment operator. 
        
        B(2,i) = A(1,1.*i) + i; % original was A(1,1i)
        
    else
        
        B(2,i) = A(1,i) + 20; % original was A(1,i,2)
        
    end 
end  % end was missing
    
    
B([1,3],:) = transpose(5*ones(5,2)); % Original was B([1 3],:)

B(b-a,2) = 12; % Original was B(a-b,2)

C = [A;B] % it was [A,B]