close all
clear;
clc;

H_0 = 10;
V_0 = 17;
dt = .01;
T = 0:dt:20;
G = 9.8;
CR = .8;

H = zeros(1,length(T));
V = zeros(1,length(T));

H(1) = H_0;
V(1) = V_0;

for cont = 2 : length(T)
    V(cont) = V(cont-1) - G*dt;
    H(cont) = H(cont-1) + V(cont) * dt;

    % Rebote
    if ( H(cont) <= 0 )
        V(cont) = -V(cont) * CR;
        H(cont)=0;
    end

end

figure(1)
set(1,'color','w')
plot(T,H)
xlabel('Tiempo (s)')
ylabel('Altura (m)')
title(['Rebotes con coeficiente de restitución CR = ' num2str(CR)])
