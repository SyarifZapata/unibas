function [f] = Cucker_Smale_ode(t, y)
N=200;
A=zeros(200);
d=zeros(1,200);
[X]= y(1:N);
K = 1/N;
sigma = 1;
beta=0.45;
Nu= @(x) K/(((sigma.^2)+x).^ beta);
for i = 1:N
    d(i)=0;
    for j = 1:N
        A(i,j) = Nu( (norm(X(i)-X(j))).^2 );
        d(i) = d(i)+A(i,j);
    end
end
D = diag(d);
x = y(1:N); v = y(N+1:end);
dxdt = v;
dvdt = -(D-A)*x;
f = [dxdt; dvdt];
end