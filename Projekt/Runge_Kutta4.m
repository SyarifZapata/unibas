function [y,t] = Runge_Kutta4(f, T, t0, y0, delta_t)
%y=zeros(400,1);
n = (T-t0)/delta_t;

k1 = delta_t .* f(t0,y0);
k2 = delta_t .* f(t0 + delta_t/2, y0 + k1./2);
k3 = delta_t .* f(t0 + delta_t/2, y0 + k2./2);
k4 = delta_t .* f(t0 + delta_t, y0 + k3);  
  
y(:,1)= y0+ ((1/6).*(k1+ (2.*k2) + (2.*k3)+ k4));
t(1)= t0+delta_t;

        for i = 2:n
            k1 = delta_t .* f(t(i-1),y(:,i-1));
            k2 = delta_t .* f(t(i-1) + delta_t/2, y(:,i-1) + k1/2);
            k3 = delta_t .* f(t(i-1) + delta_t/2, y(:,i-1) + k2/2);
            k4 = delta_t .* f(t(i-1) + delta_t, y(:,i-1) + k3);

            y(:,i) = y(:,i-1) + ((1/6).*(k1+ (2.*k2) + (2.*k3)+ k4));
            t(i)=t(i-1)+delta_t;
        end    
   
end