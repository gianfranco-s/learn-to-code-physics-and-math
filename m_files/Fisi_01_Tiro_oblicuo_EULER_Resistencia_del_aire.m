clear;
clc;
close all

ang = 75;          % º
ang = ang*pi/180;   % conversión a rad

y0 = 0;            % m
x0 = 0;            % m
v0 = 44.7;           % m/s
v0x = v0*cos(ang); % m/s
v0y = v0*sin(ang); % m/s

g = 9.81;           % m/s^2

% Datos de bala 9mm
m = 0.008;       % kg
rho = 1.275;     % kg/m^3
A = pi*(9e-3)^2; % m^2
C = .42;

% Datos de pelota de baseball
m = .145; %kg
A = pi*(.0366*2)^2/4; %m^2
C = .5; %Drag Coefficient of a sphere
rho = 1.29;

D = 0.5*rho*C*A;
tvuelo = max(roots([-.5*g v0y y0]));  % s   


%% Tiro oblicuo
dt = 0.001;
t = 0:dt:tvuelo;

r = zeros(length(t),2);  % Vector posición [x y]
r(1,:) = [x0 y0];

v = [v0x v0y];

for cont = 1 : length(t)
  v = v + [0 -g*dt];
  r(cont+1,:) = r(cont,:) + v*dt;
end

%% Efecto del aire
% F = D*v^2
% D = 0.5*rho*C*A
% Donde rho es la densidad del aire, C es el coeficiente de rozamiento
% (entre 0.2 y 1.0 para esferas), A es el área transversal del proyectil
% Del diagrama de cuerpo libre:
% Fx = -D*v^2*cos(tita)      = -D*v*vx       [v*cos(tita) = vx]
% Fy = -m*g -D*v^2*sin(tita) = -m*g -D*v*vy  [v*sin(tita) = vy]
% Luego:
% ax = -(D/m)*v*vx
% ay = -g -(D/m)*v*vy

r_aire = zeros(length(t),2);  % Vector posición [x y]
r_aire(1,:) = [x0 y0];

v = [v0x v0y];


for cont = 1 : length(t)
  a = [-(D/m)*norm(v)*v(1) , -g-(D/m)*norm(v)*v(2)];
  v = v + a*dt;
  r_aire(cont+1,:) = r_aire(cont,:) + v*dt;
end


% figure('Name','Efecto del aire')
% plot(r(:,1),r(:,2),'k-',r_aire(:,1),r_aire(:,2),'b--')
% line(xlim,[0 0],'LineStyle',':','Color','k')
% line([0 0],ylim,'LineStyle',':','Color','k')
% title('Efecto del aire')
% legend('Trayectoria conocida','Método de Euler')
% set(gca,'Fontsize',14)

%%
figure
plot(r_aire(:,1),r_aire(:,2),'b--')
line(xlim,[0 0],'LineStyle',':','Color','k')
line([0 0],ylim,'LineStyle',':','Color','k')
title('Efecto del aire')
set(gca,'Fontsize',14)
axis([0 max(r_aire(:,1)) 0 max(r_aire(:,2))]*1.2)

