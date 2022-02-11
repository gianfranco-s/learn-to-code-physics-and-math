clear;
clc;
close all;


Re = 0.1;
me = .2;

% Momento de inercia de la esfera
Ie = me*Re^2 * 2/5;

mb = .5;
L = .75;

% Momento de inercia de la barra con respecto a su extremo
Ib = mb*L^2 / 3;

% Velocidad angular
w = 50*(2*pi)*(1/60);
g = 9.8;
tita0 = 0;
a_ang = 0;
% Distancia del centro de masa de la esfera con respecto al eje de rotac
R = (L+Re);


t = linspace(0, 2*pi/abs(w),100);
dt = t(2)-t(1);

% Posición del centro de masa, en coordenadas cartesianas
x = R*cos(w*t + tita0);
y = R*sin(w*t + tita0);

% tv = t(1,1:length(t)-1);
% vx = diff(x)/Dt;
% vy = diff(y)/Dt;
% v = sqrt(vx.^2+vy.^2);

plot(x,y)
axis([-R R -R R]*1.1,'equal')
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')
title('Ubicación del centro de masa de la esfera durante el movimiento')

% Ángulos a estudiar
tita = tita0 + w*t + .5*a_ang.^2;
ang(1) =   0;
ang(2) =  90;
ang(3) = 120;
ang(4) = 270;
ang = ang*pi/180;

% Tiempo para llegar a dicho ángulo (a velocidad angular constante)
for cont = 1 : 4
    t_ang(cont) = ang(cont)/abs(w);
end

N = zeros(1,4);
for cont = 1 : 4
    N(cont) = find( t <= t_ang(cont),1,'last');
end

    


%% ------------ Aproximación 1: sumatoria de fuerzas analítica -----------------------
clc
Tx = (-me*R*w^2*cos(ang))';
Ty = (me*(g - R*w^2*sin(ang)))';

moduloT = sqrt(Tx.^2+Ty.^2);

% Resultados_M1 = table(Tx,Ty,moduloT)
disp('Resultados con expresión analítica de la fuerza')
Resultados_M1 = [Tx,Ty]

%% ------------------ Aproximación 2: estudio de la cinemática -----------------------
% Se obtiene una expresión analítica de la aceleración, y se calculan todos los
% valores de T deseados, para dichas aceleraciones.
a2 = -w^2*[x' y'];
T2 = me*a2 - [0 -me*g];

Tx2 = T2(N,1);
Ty2 = T2(N,2);
% Resultados_M2 = table(Tx2,Ty2)
disp('Resultados con expresión analítica de aceleración')
Resultados_M2 = [Tx2,Ty2]

%% ------ Aproximación 3: estudio de la cinemática, usando derivada numérica ---------
% Se obtiene la derivada numéricamente (sin expresión analítica), y en base a
% dicho cálculo se calcula T
a3 = [diff(x,2)' diff(y,2)']/dt^2;

T3 = me*a3 - [0 -me*g];

Tx3 = T3(N,1);
Ty3 = T3(N,2);
% Resultados_M2_num = table(Tx3,Ty3)
disp('Resultados evaluando segunda derivada numéricamente')
Resultados_M2 = [Tx2,Ty2]


%% ---------------------- Aproximación simbólica --------------------------
% pkg load symbolic
clear me R w g
syms me R w g
alpha = [0 pi/2 120*pi/180 3*pi/2];

% f_Tx = @(A) -me*R*w^2*cos(A);
% f_Ty = @(A) me*(g - R*w^2*sin(A));

Tsym = [-me*R*w^2*cos(ang') ,  me*(g - R*w^2*sin(ang'))];
Tsym(2,1) = 0;
Tsym(4,1) = 0;

disp('Resultados simbólicos')
disp('       Tx     ,              Ty')
disp(Tsym)
