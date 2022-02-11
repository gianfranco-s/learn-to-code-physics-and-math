clear;
clc;
% close all;
clf

%sympref reset;
%pkg load symbolic

% --------------------------- M�todo num�rico ----------------------------
% Inicializaci�n de variables:
u      = 10;           % se�al externa, correspondiente a la respuesta forzada
t_intervalo = [0 50];  % intervalo de tiempo que se desea evaluar
y0     =  4;           % valor inicial de y(t), tal que y0 = y(0)
dt = t_intervalo(2)/20;  % Intervalo entre puntos para una gr�fica

% Constantes del sistema:
A = 0.3;
B = 1;
 
% Definimos una funci�n an�nima, primero variable independiente
dy = @(t,y) -A*y + B*u;
 
% Soluci�n num�rica
[tnum,ynum] = ode45(dy,t_intervalo,y0);


% --------------------------- M�todo simb�lico ---------------------------

% Soluci�n simb�lica
syms y(t)
ode = diff(y)+A*y == u;
cond = y(0) == y0;
ySol(t) = dsolve(ode,cond);
%pretty(ySol)

% --------------------------- Soluci�n anal�tica --------------------------
y_analitica = @(t) B*u/A * (1-exp(-A*t)) + y0*exp(-A*t);
% -------------------------------------------------------------------------


figure(1)
hold on;
% Gr�fica de soluci�n anal�tica
%fplot(y_analitica,t_intervalo,'o')
ez = ezplot(y_analitica,t_intervalo);
set(ez,'DisplayName','Anal�tica','Color','k')


% Gr�fica de soluci�n num�rica
plot(tnum,ynum,'LineStyle','--','LineWidth',2,'Color','k','DisplayName','Num�rica');


% Gr�fica de soluci�n simb�lica
% ---- C�digo MATLAB -----
fplot(ySol,t_intervalo,'ko','DisplayName','Simb�lica')
% -------------------------------

% % ----C�digo Octave-----
% tt = linspace(t_intervalo(1),t_intervalo(2));
% ff = function_handle(rhs(ySol))  % Conversi�n de simb�lico a funci�n an�nima
% YY = ff(tt);
% plot(tt,YY,'ko','DisplayName','Simb�lica')
% % ------------------


hold off;

legend('Location','southeast')

title('Soluciones a una ecuaci�n diferencial de primer orden');
xlabel('t');
ylabel('y(t)');
ylim([0 35])