function [f] = leaders_ode(t,y)
N = length(y)/2; 
% N = 100

A=zeros(N);
d=zeros(1,N);
Xi = y(1:N);
Yi = y(N+1:2*N);
x = [Xi,Yi];

K = 1/N;
sigma = 1;
beta = 0.5;
gama = 0.9;
%gama = 0.2;
%gama = 0.95;
dxdt = zeros (N,2);

Nu= @(x) K/(((sigma.^2)+x).^ beta);
for i = 1:N
    d(i)=0;
    index = 1;
    sum_Aij = 0;
    for j = 1:N
        A(i,j) = Nu( (norm([Xi(i) Yi(i)]-[Xi(j) Yi(j)])).^2 );
        d(i) = d(i)+A(i,j);
        
        if i ~= j
            norm_xj = norm([Xi(j) Yi(j)])^2;
            skalProd = dot([Xi(i) Yi(i)],[Xi(j) Yi(j)]);
            ersteBed = gama * norm([Xi(i) Yi(i)]) * norm([Xi(j) Yi(j)]);
            
            x =(ersteBed <= skalProd) && (skalProd <= norm_xj);
            
            if x == 1
                anfuehrer(i,index) = j; 
                index = index+1; 
                % Addiere alle Aij von anfuehrer
                sum_Aij = sum_Aij + A(i,j).*((skalProd/norm_xj)*([Xi(i) Yi(i)]-[Xi(j) Yi(j)]));
            end
            
        end
    end
    dxdt(i,:) = (1/d(i))* sum_Aij;
end
f = [dxdt(:,1);dxdt(:,2)];


end