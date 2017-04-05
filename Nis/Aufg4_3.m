clear all;
close all;
clc;

approx_cos_1([1 2 3])
approx_cos_2([1 2 3])
approx_cos_3([1 2 3])

z = 0:pi/100:2*pi;
c1 = approx_cos_1(z);
c2 = approx_cos_2(z);
c3 = approx_cos_3(z);

plot(z,c1,z,c2,z,c3)
title('Aufg_3_1.fig')
legend('cos_1','cos_2','cos_3')

z = -pi:pi/100:3*pi;
c1 = approx_cos_1(z);
c2 = approx_cos_2(z);
c3 = approx_cos_3(z);

figure
plot(z,c1,z,c2,z,c3)
title('Aufg_3_2.fig')
legend('cos_1','cos_2','cos_3')

%Aufg d
z = -2*pi:pi/100:4*pi;
c1 = approx_cos_1(z);
c2 = approx_cos_2(z);
c3 = approx_cos_3(z);
c4 = abs(c1 - cos(z));
c5 = abs(c2 - cos(z));
c6 = abs(c3 - cos(z));

figure
plot(z,c1,z,c2,z,c3,z,c4,z,c5,z,c6)
%semilogy(z,c1,z,c2,z,c3,z,c4,z,c5,z,c6)
title('Aufg d')
legend('cos_1','cos_2','cos_3','abs_1','abs_2','abs_3')