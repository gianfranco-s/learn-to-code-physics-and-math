close all
clear;
clc;

H0 = 10;
V0 = 17;
CR = .8;
dt = 0.1;

% Etapa inicial
tv = max(roots([-.5*9.8 V0 H0]));
% t_ini = 0:dt:tv;
t_ini = linspace(0,tv,50);
dt = t_ini(2) - t_ini(1);       % Las demás definiciones de vectores de
                                % tiempo se realizan con dt, para
                                % garantizar que el vector de tiempo final
                                % tt sea "igualmente espaciado"

y_ini = H0 + V0*t_ini - .5*9.8*t_ini.^2;
% Kf - Ko + Uf - Ui = 0
% .5*m*vf^2 - .5*m*vo^2 + 0 - m*g*H0 = 0
vf  = -sqrt(2*9.8*H0 + V0^2);

plot(t_ini,y_ini,'k-')
hold on;
YY = y_ini;

% Se reciben tv, vf y CR
for cont = 1 : 10
    v0y = CR*abs(vf); % Cálculo de velocidad inicial actual
    t_vuelo_ant = max(roots([-.5*9.8 vf 0]));  % t de vuelo del disparo anterior (*)
    t_vuelo_act = max(roots([-.5*9.8 v0y 0])); % Tiempo de vuelo actual
    t = 0:dt:t_vuelo_act;            % Vector de simulación
    y = v0y*t - .5*9.8*t.^2;                   % Posiciones actuales
    t_vuelo = tv+t_vuelo_ant ;                 % Para desplazar el inicio de la gráfica
    plot(t+t_vuelo,y,'k-')
    vf = v0y;                        % Reinicio de la velocidad de disparo
    tv = t_vuelo;                    % Acumulación de tiempos anteriores
    YY = horzcat(YY,y);              % Guardo todo en un array general,
                                     % por si después quiero graficar
end
tt = linspace(0,max(t+t_vuelo),length(YY));
% plot(tt,YY,'--')
hold off;

% (*) En el caso del disparo inicial, vf = -(número), por lo que las raíces
% dan 0 y -(cte). Se toma la mayor, por lo que t_vuelo_ant(inicial) = 0

