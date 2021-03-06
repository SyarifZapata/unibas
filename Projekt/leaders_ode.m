function [f] = leaders_ode(t,y)
N = length(y)/2; 

A=zeros(N);
d=zeros(1,N);
%y aussortieren
Xi = y(1:N);
Yi = y(N+1:2*N);
% x werte zu ein N x 2 matrix fassen
x = [Xi,Yi];

K = 1/N;
sigma = 1;
beta = 0.5;

%gama = 0.9;
%gama = 0.2;
gama = 0.95;

% initialisiere dxdt fuer bessere performance
dxdt = zeros (N,2);

Nu= @(x) K/(((sigma.^2)+x).^ beta);

for i = 1:N
    d(i)=0;
    sum_Aij = 0;
    index=1;
    for j = 1:N
        A(i,j) = Nu( norm(x(i,:)-x(j,:)).^2 );
        d(i) = d(i)+A(i,j);
        
        
         norm_xj = norm(x(j,:)).^2;
         skalProd = dot(x(i,:),x(j,:));
         ersteBed = gama * (norm(x(i,:)) * norm(x(j,:)));
            
         bool =(ersteBed <= skalProd) && (skalProd <= norm_xj);
         % Hier wird die Menge Ni {...} gefuellt.  
         if bool == 1
             % variable Ni is nur fuer kontrolle gedacht.
             Ni(i,index) = j;
             index = index+1;
             sum_Aij = sum_Aij + A(i,j).*((skalProd/norm_xj)*x(j,:)-x(i,:));
         end   
               
        
    end
    dxdt(i,:) = (1/d(i))* sum_Aij;
end
% dxdt in der linearisierten Form bringen
f = [dxdt(:,1);dxdt(:,2)];


end