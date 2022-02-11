% Autor:         G. Salomone
% Tema:          Comparación entre método simbólico y método numérico 
% Fecha:         8/5/2020
% Comentarios:   -

clear;
clc;
% close all

m   =  1.0 ;     % [kg]
g   =  9.8 ;     % [m s^-2]
v0y =  4.0 ;     % [m s^-1]
y0  =  1.0 ;     % [m]

fy = @(t) -0.5*g*t.^2 + v0y*t + y0;

tvuelo = roots([-.5*g v0y y0]);
tvuelo = tvuelo(tvuelo > 0);

dt = tvuelo/50;
t = 0:dt:tvuelo;


%% Método simbólico para graficar la posición con respecto al tiempo

y_simb = fy(t);
% fighand = figure(1);
% set(fighand,'color','w');
% plot(t,y_simb)
% xlabel('t','FontSize',14)
% ylabel('y','FontSize',14)
% title('Posición con cinemática','FontSize',18)
% grid

%% Método numérico para graficar la posición con respecto al tiempo
% Requiere resolver la ecuación diferencial. Lo haremos utilizando un bucle
% La ecuación es: -m*g = m * ddy/ddt
% Simplificando: -g = ddy/ddt

y_num = zeros(1,length(t));
y_num(1) = y0;

veloc = zeros(1,length(t));
veloc(1) = v0y;              % Valor final de la etapa anterior

acel = zeros(1,length(t));
acel(1) = -g;



for cont = 1 : length(t)-1
  acel(cont+1) = -g;                                % -m*g = m*ay
  veloc(cont+1) = veloc(cont) + acel(cont+1)*dt;
  y_num(cont+1) = y_num(cont) + veloc(cont+1)*dt;
end


% fighand = figure(2);
% set(fighand,'color','w');
% plot(t,y_num,'o')
% xlabel('t','FontSize',14)
% ylabel('y','FontSize',14)
% title('Posición con dinámica','FontSize',18)
% grid


fighand = figure(3);
set(fighand,'color','w');
plot(t,y_simb,t,y_num,'g')
legend('Cinemática','Dinámica')
xlabel('t','FontSize',14)
ylabel('y','FontSize',14)
title('Comparación','FontSize',18)
grid
