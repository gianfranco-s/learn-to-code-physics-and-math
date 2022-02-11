clc;
clear;
close all;

L = .5;
w0 = -100*2*pi/60; % el signo (-) indica rotaci�n horaria
g = 9.8;
H = 1.5;
tita0 = 3*pi/2;
a_ang = -1;  % el signo (-) indica rotaci�n horaria

% Para el disparo (origen de coordenadas 1,5m debajo de A (que a su vez se
% encuentra a una distancia L del centro de rotaci�n.
y0 = L + H;


% Para conocer la trayectoria luego del disparo, necesitamos conocer la
% velocidad tangencial al momento del mismo.
% vx = dx/dt ; vy = dy/dt
% La posici�n del centro de masa de la esfera puede determinarse seg�n
% x = L*cos(tita)
% y = y0 + L*sin(tita)

% Posici�n angular, con respecto al eje de rotaci�n:
dt = .001;
t = 0:dt:4;
tita = tita0 + w0*t + .5*a_ang*t.^2;

x_rotac = L * cos(tita);
y_rotac = y0 + L*sin(tita);

vx = diff(x_rotac)/dt;   % Velocidad en x durante la rotaci�n
vy = diff(y_rotac)/dt;   % Velocidad en y durante la rotaci�n


figure(1)
plot(x_rotac,y_rotac)
axis([-max(x_rotac)*1.1 max(x_rotac)*1.1 -0.5 max(y_rotac)*1.1],'equal')
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')
title('Trayectoria de rotaci�n')
xlabel('x (m)')
ylabel('y (m)')

% �Para qu� valor de t, tita == 120� (punto B)?
caso(1) = 120;
N(1) = find(tita >= caso(1)*pi/180 , 1 , 'last');
% t(N_B) % debe ser 0.247
t_caso(1) = t(N(1));


% Misma pregunta para 90� y 0�
caso(2) = 90;
N(2) = find(tita >= caso(2)*pi/180 , 1 , 'last');
t_caso(2) = t(N(2));

caso(3) = 0;
N(3) = find(tita >= caso(3)*pi/180 , 1 , 'last');
t_caso(3) = t(N(3));

figure(4)
K = 1;
subplot(1,3,K)
plot(x_rotac(1:N(K)),y_rotac(1:N(K)))
axis([-max(x_rotac)*1.1 max(x_rotac)*1.1 -0.5 max(y_rotac)*1.1],'equal')
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')
title(['Trayectoria de rotaci�n hasta ',num2str(caso(K)),'�'])
xlabel('x (m)')
ylabel('y (m)')

K = K+1;
subplot(1,3,K)
plot(x_rotac(1:N(K)),y_rotac(1:N(K)))
axis([-max(x_rotac)*1.1 max(x_rotac)*1.1 -0.5 max(y_rotac)*1.1],'equal')
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')
title(['Trayectoria de rotaci�n hasta ',num2str(caso(K)),'�'])
xlabel('x (m)')
ylabel('y (m)')

K = K+1;
subplot(1,3,K)
plot(x_rotac(1:N(K)),y_rotac(1:N(K)))
axis([-max(x_rotac)*1.1 max(x_rotac)*1.1 -0.5 max(y_rotac)*1.1],'equal')
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')
title(['Trayectoria de rotaci�n hasta ',num2str(caso(K)),'�'])
xlabel('x (m)')
ylabel('y (m)')


%% Disparo desde punto D
clc
for K = 1 : 3
    Voy(K) = vy(N(K));
    Vox(K) = vx(N(K));
    % Tiempo de vuelo:
    % 0 = Yo + voy * t_vuelo - 0.5g*t_vuelo^2
    t_vuelo(K) = max(roots([-.5*g Voy(K) y_rotac(K)]));
end

t1 = 0:dt:t_vuelo(1);
t2 = 0:dt:t_vuelo(2);
t3 = 0:dt:t_vuelo(3);
% No se pueden guardar en una matriz porque tienen distinto largo


%% CASO--------------------
K = 1;
%--------------------------
x_lin = x_rotac(N(K)) + Vox(K)*t1;
y_lin = y_rotac(N(K)) + Voy(K)*t1 - .5*g*t1.^2;

% Trayectoria
figure(K)
set(K,'color','w')

plot(x_rotac(1:N(K)),y_rotac(1:N(K)),x_lin(1,:),y_lin(1,:),'--')

titulo = sprintf(['Gr�fica de trayectoria \n','�ngulo de disparo: ',...
    num2str(caso(K)),'�']);
title(titulo)

xlabel('x(m)')
ylabel('y(m)')
% axis([-0.5 1 0 2.5])
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')
axis equal
legend('Movimiento circular','Disparo')

%% CASO--------------------
K = 2;
clear x_lin y_lin
%--------------------------
x_lin = x_rotac(N(K)) + Vox(K)*t2;
y_lin = y_rotac(N(K)) + Voy(K)*t2 - .5*g*t2.^2;

% Trayectoria
figure(K)
set(K,'color','w')

plot(x_rotac(1:N(K)),y_rotac(1:N(K)),x_lin(1,:),y_lin(1,:),'--')

titulo = sprintf(['Gr�fica de trayectoria \n','�ngulo de disparo: ',...
    num2str(caso(K)),'�']);
title(titulo)

xlabel('x(m)')
ylabel('y(m)')
% axis([-0.5 1 0 2.5])
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')
axis equal
legend('Movimiento circular','Disparo')

%% CASO--------------------
K = 3;
%--------------------------
clear x_lin y_lin
x_lin = x_rotac(N(K)) + Vox(K)*t3;
y_lin = y_rotac(N(K)) + Voy(K)*t3 - .5*g*t3.^2;

% Trayectoria
figure(K)
set(K,'color','w')

plot(x_rotac(1:N(K)),y_rotac(1:N(K)),x_lin(1,:),y_lin(1,:),'--')

titulo = sprintf(['Gr�fica de trayectoria \n','�ngulo de disparo: ',...
    num2str(caso(K)),'�']);
title(titulo)

xlabel('x(m)')
ylabel('y(m)')
% axis([-0.5 1 0 2.5])
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')
axis equal
legend('Movimiento circular','Disparo')

