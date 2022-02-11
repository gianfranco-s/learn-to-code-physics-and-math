clear;
clc;
% close all;
clf

%sympref reset;
%pkg load symbolic

% --------------------------- Método numérico ----------------------------
% Inicialización de variables:
u      = 10;           % señal externa, correspondiente a la respuesta forzada
t_intervalo = [0 50];  % intervalo de tiempo que se desea evaluar
y0     =  4;           % valor inicial de y(t), tal que y0 = y(0)
dt = t_intervalo(2)/20;  % Intervalo entre puntos para una gráfica

% Constantes del sistema:
A = 0.3;
B = 1;
 
% Definimos una función anónima, primero variable independiente
dy = @(t,y) -A*y + B*u;
 
% Solución numérica
[tnum,ynum] = ode45(dy,t_intervalo,y0);


% --------------------------- Método simbólico ---------------------------

% Solución simbólica
syms y(t)
ode = diff(y)+A*y == u;
cond = y(0) == y0;
ySol(t) = dsolve(ode,cond);
%pretty(ySol)

% --------------------------- Solución analítica --------------------------
y_analitica = @(t) B*u/A * (1-exp(-A*t)) + y0*exp(-A*t);
% -------------------------------------------------------------------------


figure(1)
hold on;
% Gráfica de solución analítica
%fplot(y_analitica,t_intervalo,'o')
ez = ezplot(y_analitica,t_intervalo);
set(ez,'DisplayName','Analítica','Color','k')


% Gráfica de solución numérica
plot(tnum,ynum,'LineStyle','--','LineWidth',2,'Color','k','DisplayName','Numérica');


% Gráfica de solución simbólica
% ---- Código MATLAB -----
fplot(ySol,t_intervalo,'ko','DisplayName','Simbólica')
% -------------------------------

% % ----Código Octave-----
% tt = linspace(t_intervalo(1),t_intervalo(2));
% ff = function_handle(rhs(ySol))  % Conversión de simbólico a función anónima
% YY = ff(tt);
% plot(tt,YY,'ko','DisplayName','Simbólica')
% % ------------------


hold off;

legend('Location','southeast')

title('Soluciones a una ecuación diferencial de primer orden');
xlabel('t');
ylabel('y(t)');
ylim([0 35])