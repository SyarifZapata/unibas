clc;
clear all;
close all;
w1 = 1;
w2 = 1./2 + sin(3/pi)*1i;
w3 = -1./2 + sin(3/pi)*1i;
w4 = -1;
w5 = -1./2 - sin(3/pi)*1i;
w6 = 1./2 - sin(3/pi)*1i;
w=[w1,w2,w3,w4,w5,w6];

% z = a + ib;
figure
plot(real(w),imag(w),'o')

axis([-2 2 -2 2])
axis('square')

while true
     [x,y,button] = ginput(1);
    
    if button ~= 1
        break
    end
    
  
    axis([-2 2 -2 2])
    axis('square')
    
    
    


z1 = x + 1i*y;


f = @(z) z.^6-1; % funktion
df = @(z) 6*z.^5; % erste Ableitung 


z = newton50(f, df, z1);

x = -2:0.1:2;





plot(real(w1), 0, 'o')
hold on
plot(real(w2), 1, 'o')
hold on
plot(real(w3), 1, 'o')
hold on
plot(real(w4), 0, 'o')
hold on
plot(real(w5), -1, 'o')
hold on
plot(real(w6),-1, 'o')
hold on
plot(real(z), imag(z),'s-')
hold off

axis([-2 2 -2 2])
axis('square')

end
