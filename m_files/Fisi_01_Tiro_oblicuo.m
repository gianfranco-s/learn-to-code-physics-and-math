clear;
clc;
close all

ang = 30;
ang = 30*pi/180;

y0 = 5;
x0 = 0;
v0 = 45;
v0x = v0*cos(ang);
v0y = v0*sin(ang);

g = 9.8;
fx = @(t) v0x*t + x0;
fy = @(t) -0.5*g*t.^2 + v0y*t + y0;



% tvuelo = (v0y + sqrt(v0y^2+2*g*y0))/g
% O bien
auxiliar = roots([-.5*g v0y y0]);
tvuelo = auxiliar(auxiliar >= 0);      % tvuelo = auxiliar, si auxiliar >= 0

dt = .01;
t = 0:dt:tvuelo;
y = fy(t);
x = fx(t);

%% Trayectoria
fighand = figure(1);
set(fighand,'color','w');
plot(x,y)
r_vector = [x ; y];
xlabel('x','FontSize',14)
ylabel('y','FontSize',14)
title('Trayectoria','FontSize',18)
axis([0 200 0 35])

% Anotaciones
str = {'Punto de máxima altura','\downarrow'};
thand = text(89.5,32,str,'HorizontalAlignment','center',...
             'FontSize',14);
% thand.FontSize = 14;  % No funciona en Octave
grid


%% -------------------------------------------------------------
%  --------------- Análisis del vector velocidad ---------------
vx = diff(x)/dt;   % Derivada temporal de la posición en x
vy = diff(y)/dt;   % Derivada temporal de la posición en y
v_vector = [vx ; vy];

% O bien
% v_vector = [diff(r_vector(1,:)) ; diff(r_vector(2,:))];

% Cuatro puntos de la trayectoria (asociado con el tamaño de t)
N = [1 240 350 480 ];

for cont = 1 : 4
  vv(1:2,cont) = v_vector(1:2,N(cont));  % vv(1,cont) es la velocidad en x
                                         % vv(2,cont) es la velocidad en y
end

% O bien
%for cont = 1 : 4
%  vv(1,cont) = v_vector(1,N(cont));  % vv(1,cont) es la velocidad en x
%  vv(2,cont) = v_vector(2,N(cont));  % vv(2,cont) es la velocidad en y
%end

% Puntos a evaluar:
for cont = 1 : 4
  rr(1:2,cont) = r_vector(1:2,N(cont));  % r_vector(1,cont) es la posición en x
                                         % r_vector(2,cont) es la posición en y
end

fighand = figure(2);
set(fighand,'color','w')
quiver(rr(1,:),rr(2,:),vv(1,:),vv(2,:),'MaxHeadSize',.1,'Marker','s')
hold on
plot(r_vector(1,:),r_vector(2,:),'b-')
hold off

%% -------------------------------------------------------------
%  ---------------- Respuesta en el tiempo ---------------------
fighand = figure(3);
set(fighand,'color','w')

% ***  Posición  ***
% En x
subplot(3,2,1)
plot(t,x)
ylabel('Posición (m)')
title('Evolución temporal en el eje x')
xlim([0 5])
% En y
subplot(3,2,2)
plot(t,y)
title('Evolución temporal en el eje y')
xlim([0 5])

% ***  Velocidad  ***
% En x
subplot(3,2,3)
plot(t(1:end-1),vx)
ylabel('Velocidad (m/s)')
axis([0 5 0 max(vx)*1.5])

% En y
subplot(3,2,4)
plot(t(1:end-1),vy)
line(xlim,[0 0],'LineStyle',':')
xlim([0 5])

% ***  Aceleración ***
% En x
subplot(3,2,5)
plot(t(1:end-2),diff(vx)/dt)
ylabel('Aceleración (m/s^2)')
xlabel('Tiempo (s)')
axis([0 5 -1 1])

% En y
subplot(3,2,6)
plot(t(1:end-2),diff(vy)/dt)
line(xlim,[0 0],'LineStyle',':')   % Marca del eje x
axis([0 5 -12 1])
xlabel('Tiempo (s)')


%% Velocidad final
disp('Vector velocidad final')
disp(v_vector(1:2,end))
disp('Rapidez final')
disp(norm(v_vector(1:2,end)))