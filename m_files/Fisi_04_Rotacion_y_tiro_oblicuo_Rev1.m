clc;
clear;
close all;

L = .5;
w0 = -100*2*pi/60; % el signo (-) indica rotación horaria
g = 9.8;
H = 1.5;
tita0 = 3*pi/2;
a_ang = -1;  % el signo (-) indica rotación horaria

% Para el disparo (origen de coordenadas 1,5m debajo de A (que a su vez se
% encuentra a una distancia L del centro de rotación.
y0 = L + H;

ANG_DISPARO = 120;                  % En grados
ANG_DISPARO = ANG_DISPARO*pi/180;   % Conversión a radianes

% Posición angular, con respecto al eje de rotación:
dt = .001;
t = 0:dt:4;   % Luego de 4s, se ha dado más de una vuelta
tita = tita0 + w0*t + .5*a_ang*t.^2;

x_rotac = L * cos(tita);
y_rotac = y0 + L*sin(tita);

vx = diff(x_rotac)/dt;   % Velocidad en x durante la rotación
vy = diff(y_rotac)/dt;   % Velocidad en y durante la rotación

% ¿Para qué valor de t, tita == 120º (punto B)?
N = find(tita >= ANG_DISPARO , 1 , 'last');
t_ang = t(N); % Instante en que se llega al ángulo deseado

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t_caida = max(roots([-.5*g vy(N) y_rotac(N)])); 
% AJUSTAR, PORQUE NO SE LLEGA HASTA EL SUELO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t_vuelo = 0:dt:t_caida;

x_lin = x_rotac(N) + vx(N)*t_vuelo;
y_lin = y_rotac(N) + vy(N)*t_vuelo - .5*g*t_vuelo.^2;


figure(1)
set(1,'color','w')
plot(x_rotac(1:N),y_rotac(1:N),x_lin,y_lin,'--')
axis([-L*1.5 max(x_lin)*1.1 -0.5 max(y_rotac)*1.1],'equal')
line(xlim,[0 0],'LineStyle',':','Color','k')
line([0 0],ylim,'LineStyle',':','Color','k')
title(['Trayectoria con ángulo de disparo ',num2str(ANG_DISPARO*180/pi),'°'])
xlabel('x (m)')
ylabel('y (m)')
legend('Movimiento circular','Disparo')


X = [x_rotac(1:N-1) x_lin];
Y = [y_rotac(1:N-1) y_lin];

VX = diff(X)/dt;
VY = diff(Y)/dt;

t_total = [t(1:N-1) t_vuelo+t(N)]; % + t(N-1) para no agregar t(N) dos veces
%%
figure(2)
set(2,'color','w')

subplot(3,2,[1 2])
plot(X,Y,X(N),Y(N),'o')
title('Trayectoria')
xlabel('x (m)')
ylabel('y (m)')
axis equal
xlim([min(X) max(X)]*1.2)
ylim([-.5 max(Y)]*1.2)
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')


subplot(3,2,3)
plot(t_total,X)
title('Eje X, en el tiempo')
ylabel('Posición (m) ')
% axis([0 max(t_total) ]*1.1)
xlim([0 max(t_total)])
ylim([min(X) max(X)]*1.2)
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')

subplot(3,2,4)
plot(t_total,Y)
title('Eje Y, en el tiempo')
xlim([0 max(t_total)])
ylim([0 max(Y)]*1.2)
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')

subplot(3,2,5)
plot(t_total(1:end-1),VX)
ylabel('Velocidad (m/s) ')
xlabel('Tiempo (s)')
xlim([0 max(t_total)])
ylim([min(VX) max(VX)]*1.2)
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')

subplot(3,2,6)
plot(t_total(1:end-1),VY)
xlabel('Tiempo (s)')
xlim([0 max(t_total)])
ylim([min(VY) max(VY)]*1.2)
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')







