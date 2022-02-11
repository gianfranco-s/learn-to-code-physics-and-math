% Una pelota de masa 0,3kg se deja caer desde una altura de 1,2m sobre la
% parte alta de un resorte fijo vertical de constante elástica 350 N/m.
% a) Graficar la posición y(t)
% b) Determinar la velocidad del móvil cuando el resorte se comprime 0,05m


clear;
clc;
close all;

m = 0.3;
h = 1.2;
k = 350;
g = 9.8;

% 
% % ---------- Determinación de distancia máxima de compresión --------------
% % Método simbólico
% syms d
% eqn = (0-m*g*(h+d)) + (.5*k*d^2) == 0;
% dd = solve(eqn,d);
% 
% % Valor numérico de la compresión
% vpa(dd)
% 
% % Método numérico
% 
% d_num = roots([k/(2*m*g) -1 -h])
% 
% % Determinación de la velocidad en la posición db
% db = 5e-2;
% v = sqrt(2*g*(h+db) - k*db^2/m)
% % -------------------------------------------------------------------------


% ------------------ Posición ------------------
% Origen de coordenadas en la posición de equilibrio del resorte

% Caida libre
t_vuelo = sqrt(2*h/g);

dt = .001;
t = 0:dt:t_vuelo;

y = h + 0 - 0.5*g*t.^2;
vy = 0-g*t;

% figure(1)
% subplot(2,1,1)
% plot(t,y)
% 
% subplot(2,1,2)
% plot(t,vy)


% Acción del resorte:
T = 2*pi/sqrt(k/m);
t_el = 0:dt:T;
y_el = zeros(1,length(t_el));
y_el(1) = 0;

v_el = zeros(1,length(t_el));
% v_el(1) = -sqrt(2*g*h);       % Valor verdadero
v_el(1) = vy(end);              % Valor final de la etapa anterior


a_el = zeros(1,length(t_el));
a_el(1) = g;



for cont = 1 : length(t_el)-1
    
%   % --- Euler --          % Deja de ser válido luego de un perido, en este
%                           % caso
%   a_el(cont+1) = -k/m*y_el(cont) - g;
%   v_el(cont+1) = v_el(cont) + a_el(cont)*dt;
%   y_el(cont+1) = y_el(cont) + v_el(cont)*dt;
%   % -- \Euler --

%   % --- Verlet --       % Converge mejor que Euler
%   a_el(cont+1) = -k/m*y_el(cont) - g;
%   v_el(cont+1) = v_el(cont) + (a_el(cont)+a_el(cont+1))* .5 *dt;
%   y_el(cont+1) = y_el(cont) + v_el(cont)*dt + .5 * a_el(cont) * dt^2;
%   % -- \Verlet --
  
  % --- Euler-Cromer -- % Converge mejor que los dos anteriores.
  a_el(cont+1) = -k/m*y_el(cont) - g;
  v_el(cont+1) = v_el(cont) + a_el(cont+1)*dt;
  y_el(cont+1) = y_el(cont) + v_el(cont+1)*dt;
  % -- \Euler-Cromer --
end


t_final = [ t(1:end-1)  t_el+t(end)];
y_final = [ y(1:end-1)  y_el];
v_final = [vy(1:end-1)  v_el];

DY = -0.05*ones(1,length(y_final));

% Returns Approximate Zero-Crossing Indices Of Argument Vector
% zci = @(v) find(v(:).*circshift(v(:), [-1 0]) <= 0);
% N = zci(y_final - DY);  % Interesan los casos en que y_final == DY, o bien
%                         % y_final - DY == 0
% N = min(N);     % Determino el menor valor de N.

% Podría funcionar:
N = find(y_final - DY < 0 , 1 , 'first');
% Ver cómo evoluciona la función y_final - DY. El primer valor negativo
% ocurre justo después del cruce por cero.

disp(['Velocidad al momento de compresión de ' num2str(DY(1)),...
      'm: v = ' num2str(v_final(N))])

figure(2)
subplot(2,1,1)
plot(t_final,y_final)
line(xlim,[DY(1) DY(1)],'LineStyle',':')
line(xlim,[0 0],'LineStyle','--','Color','k')
line([1 1]*t_final(N),ylim,'LineStyle',':')
ylabel('Y(t)','Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')

subplot(2,1,2)
plot(t_final,v_final);
line([1 1]*t_final(N),ylim,'LineStyle',':')
ylabel('$V_y(t)$','Interpreter','latex')
xlabel('t','Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')


% 
% figure(3)
% plot(t_final,y_final-DY,t_final,y_final)
% line(xlim,[0 0],'LineStyle',':')

disp(['Máxima compresión: d = ' num2str(abs(min(y_final)))])