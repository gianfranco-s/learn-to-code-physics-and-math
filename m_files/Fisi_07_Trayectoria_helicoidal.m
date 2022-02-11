clc;
clear;
% close all;
clf

q = 1;     	% Carga en Coulomb (C)
B0 = [1 0 0];   % Campo magnético en Tesla (T)
v0 = [.2 3 0];  % Velocidad en m/s

r0 = [0 0 6];   % Posición en m
m = 1;          % Masa en kg

% Rcurvatura = m*v0(2)/(q*B0(1))

% % Aproximación de Euler (con dt = 0.001, requiere 50.000 pasos)
% dt = .001;      % s
% t = 0:dt:50;
% r = zeros(length(t),3);
% v = zeros(length(t),3);
% a = zeros(length(t),3);
% 
% a(1,:) = cross(v0,B0)*q/m;
% v(1,:) = v0;
% r(1,:) = r0;
% 
% 
% for cont = 1 : length(t)
%    a(cont+1,:) = cross(v(cont,:),B0)*q/m;
%    % A(cont) = norm(a(cont,:)); % Sería el módulo de aeleración
%    v(cont+1,:) = v(cont,:) + a(cont,:)*dt;
%    r(cont+1,:) = r(cont,:) + v(cont,:)*dt;
% end
% % ------ Fin Euler----------

% --Aproximación de Verlet de velocidad (con dt = 0.01, requiere 5.000 pasos)
dt = .01;      % s
t = 0:dt:50;
r = zeros(length(t),3);
v = zeros(length(t),3);
a = zeros(length(t),3);
% A = zeros(length(t),1);

r(1,:) = r0;
v(1,:) = v0;

for cont = 1 : length(t)-1
    a(cont,:) = cross(v(cont,:),B0)*q/m;  % REVISAR Si le pongo 
    % a(cont+1,:)?? % REVISAR Si le pongo así, converge más lentamente,
    % pero así es como dice la bibliografía que debería ser
    v(cont+1,:) = v(cont,:) + (a(cont,:)+a(cont+1,:))* .5 *dt;
    r(cont+1,:) = r(cont,:) + v(cont,:)*dt + .5 * a(cont,:) * dt^2;
end
% ------ Fin Verlet ----------

figure(1)  
plot3(r(:,1),r(:,2),r(:,3),'-',r0(1),r0(2),r0(3),'o')
axis equal    
line([0 0],[0 0],zlim,'LineStyle',':','Color','k','LineWidth',1)
line([0 0],ylim,[0 0],'LineStyle',':','Color','k','LineWidth',1)
line(xlim,[0 0],[0 0],'LineStyle',':','Color','k','LineWidth',1)
xlabel('x')
ylabel('y')
zlabel('z')

title(["Trayectoria de una partícula cargada" ;...
       "   en un campo magnético uniforme"])
ax = gca;
set(ax,'FontSize',16)
