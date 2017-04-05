clear;
clc;

    z = 0:(pi/100):(2*pi);
    p1 = approx_cos_1(z);
    p2 = approx_cos_2(z);
    p3 = approx_cos_3(z);

plot(z,p1,z,p2,z,p3)
title('Aufg_3_1.fig')
legend('cos_1','cos_2','cos_3')

