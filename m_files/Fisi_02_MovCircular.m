clear;
clc;
% close all;

% Datos
acel_ang0 = 1;
vel_ang0 = 2;
ang0 = 0;
R = 0.2;
tf = 5;

% Posición angular en el tiempo:
t = linspace(0,tf,5000);  % Qué ocurre para cantidad menor de muestras?
tita = ang0 + vel_ang0*t + .5*acel_ang0*t.^2;
vel_ang = vel_ang0 + acel_ang0*t;

% o bien
% vel_ang = diff(tita)./diff(t); % Para x e y usar t(1:end-1)


% Proyecciones en x e y:
x = R*cos(vel_ang.*t);
y = R*sin(vel_ang.*t);

%%
fighand = figure(1);
set(fighand,'color','w')

plot(x*100,y*100)
xlabel('Proyección sobre el eje x (cm) ')
ylabel('Proyección sobre el eje y (cm) ')
title('Trayectoria de un movimiento circular variado')
axis equal;
ylim([-25 25])
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')


%%
fighand = figure(2);
set(fighand,'color','w')

subplot(2,1,1)
plot(t,tita)
ylabel('\theta (rad) ')
title('Evolución en el tiempo de posición y velocidad')

subplot(2,1,2)
plot(t,vel_ang)
xlabel('Tiempo (s)')
ylabel('\omega (rad/s) ')

%%
fighand = figure(3);
set(fighand,'color','w')

subplot(2,1,1)
plot(t,x*100)
ylabel('Proyección en x (cm) ')
title('Evolución en el tiempo de las proyecciones en ejes cartesianos')

subplot(2,1,2)
plot(t,y*100)
ylabel('Proyección en y (cm) ')
xlabel('Tiempo (s)')

%%
% fighand = figure(4);
% set(fighand,'color','w')
% 
% plot(tita,vel_ang)
% title('Relación entre \theta(t) y \omega(t)')