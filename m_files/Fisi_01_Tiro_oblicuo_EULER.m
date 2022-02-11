clear;
clc;
close all

ang = 30;          % º
ang = 30*pi/180;   % conversión a rad

y0 = 5;            % m
x0 = 0;            % m
v0 = 45;           % m/s
v0x = v0*cos(ang); % m/s
v0y = v0*sin(ang); % m/s

g = 9.8;           % m/s^2


tvuelo = max(roots([-.5*g v0y y0]));  % s   

%% Trayectoria conocida
dt = .1;
t = 0:dt:tvuelo;                      % s
y = -0.5*g*t.^2 + v0y*t + y0;         % m
x = v0x*t + x0;                       % m

fighand = figure(1);
set(fighand,'color','w');
plot(x,y)
xlabel('x','FontSize',14)
ylabel('y','FontSize',14)
title('Trayectoria','FontSize',18)
axis([0 200 0 35])

%% Trayectoria estimada con método de Euler
x_euler = zeros(1,length(t));
y_euler = zeros(1,length(t));

x_euler(1) = x0;
y_euler(1) = y0;

vx = v0x;
vy = v0y;
% dt = 0.01;

% Movimiento vertical
for cont = 1 : length(t)
  vy = vy -g*dt;
  y_euler(cont+1) = y_euler(cont)+vy*dt;
endfor

% Movimiento horizontal
for cont = 1 : length(t)
  x_euler(cont+1) = x_euler(cont)+vx*dt;
endfor

% O bien
% x_euler = zeros(1,length(t))';
% y_euler = zeros(1,length(t))';
% 
% r = [x_euler y_euler];
% r(1,:) = [x0 y0];
% 
% v = [v0x v0y];
% 
% 
% for cont = 1 : length(t)
%   v = v + [0 -g*dt];
%   r(cont+1,:) = r(cont,:) + v*dt;
% end
% ....


figure(2)
plot(x,y,x_euler,y_euler,'--')
legend('Trayectoria conocida','Método de Euler')
line(xlim,[0 0],'LineStyle',':','Color','k')
line([0 0],ylim,'LineStyle',':','Color','k')
title('Comparación con aproximación de Euler')
set(gca,'Fontsize',14)