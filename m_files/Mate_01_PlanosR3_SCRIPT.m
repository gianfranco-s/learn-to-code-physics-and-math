clc;
close all;
clear;
% Cargar D.
D = -1;

% Tres puntos que definen al plano
P1 = [1,0,0];
P2 = [0,1,0];
P3 = [0,0,1];

solucion = [P1;P2;P3]\[-D;-D;-D];    % "solución" contiene los valores de A, B y C
A = solucion(1);
B = solucion(2);
C = solucion(3);

[x,y] = meshgrid(-2:.5:2);

% Definición del plano:

z1 = -(A*x + B*y + D)/C ;

figure(1)
set(1,'color','w')

FILA = 2;
COLU = 4;
subplot(FILA,COLU,1)
surf(x,y,z1,'FaceAlpha',1)  % FaceAlpha indica la transparencia
view(145,25)                 % Punto de vista (Azimuth, Elevación)

xL = xlim;
yL = ylim;
zL = zlim;

% Ejes coordenados
line([0 0],yL,[0 0],'LineStyle',':','LineWidth',2,'Color','k');   %x-axis
line(xL,[0 0],[0 0],'LineStyle',':','LineWidth',2,'Color','k');   %y-axis
line([0 0],[0 0],zL,'LineStyle',':','LineWidth',2,'Color','k');   %z-axis
xlabel('X')
ylabel('Y')
zlabel('Z')

% Plano XZ
subplot(FILA,COLU,2)
surf(x,y,z1)
xlabel('X')
ylabel('Y')
zlabel('Z')
view([180,0])        

% Plano YZ
subplot(FILA,COLU,5)
surf(x,y,z1)
xlabel('X')
ylabel('Y')
zlabel('Z')
view([90,0])

% Plano XY
subplot(FILA,COLU,6)
surf(x,y,z1)
xlabel('X')
ylabel('Y')
zlabel('Z')
view([0,90])

t = (-5:1:5)';  % Parámetro para la curva
x0 = -.50;
y0 = -.50;
z0 = -(A*x0 + B*y0 + D)/C ;
% r0 = [x0,y0,z0];
r0 = [0 0 0];
v1 = [A B C];
r_norm = v1.*t + r0;


subplot(FILA,COLU,[3 4 7 8])
surf(x,y,z1)
line(r_norm(:,1),r_norm(:,2),r_norm(:,3),...
    'LineStyle','--','LineWidth',2,'Color','k')

axis equal    % Para no perder la relación de aspecto
xlabel('X')
ylabel('Y')
zlabel('Z')
view(-170,20) 
title('Plano con su recta normal')