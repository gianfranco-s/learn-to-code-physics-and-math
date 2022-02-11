clear;
clc;
% close all;

% Gravitación

R = 3;
w = 2*pi;
T1 = 2*pi/w;
dt = .01;
t = (0:dt:T1)';


% Coordenadas del centro del círculo/elipse
xo = 2;     
yo = 1;

ancho = R;                   % 2*a = ancho                         (m)
alto = .8*ancho;                % 2*b = alto                          (m)
exc = sqrt(1-(alto/ancho)^2);   % Excentricidad                       ( )
c = sqrt(ancho^2-alto^2);       % Dist. desde el centro hasta el foco (m)
x_focos = [ xo-c xo+c ]; % (m)
y_focos = [  yo   yo  ]; % (m)


% Animación de una trayectoria conocida
% Ecuación implícita
% (x-xo)^2 / a^2 + (y-yo)^2 / b^2 = 1

% Despejando y:
% y = yo +- sqrt( a*(1 -(x-xo)^2 / b) )
x_imp = -R:dt:R;
x_imp = x_imp+xo;
y_imp_pos = yo + sqrt( alto^2*(1 -(x_imp-xo).^2 / ancho^2) );  % y implícita positiva (m)
y_imp_neg = yo - sqrt( alto^2*(1 -(x_imp-xo).^2 / ancho^2) );  % y implícita positiva (m)

% -------------------------------- Figura 1 -------------------------------
figure(1)
plot(x_imp,y_imp_pos,'k-',x_imp,y_imp_neg,'k-','LineWidth',1);

hold on;
plot(x_focos(1),y_focos(1),'Marker','o','MarkerFaceColor','yellow',...
     'MarkerSize',8*R)
plot(x_focos(2),y_focos(2),'Marker','^','MarkerSize',2*R)
hold off;

axis([-5 5 -5 5])
axis equal
line(xlim,[0 0],'LineStyle',':','Color','k')
line([0 0],ylim,'LineStyle',':','Color','k')
% Ejes de la elipse
line(xlim,[yo yo],'LineStyle','-.','Color','k')
line([xo xo],ylim,'LineStyle','-.','Color','k')

%  Ecuación paramétrica
x = ancho*cos(w*t)+xo;
y = alto *sin(w*t)+yo;

hold on;
p = plot(x(1),y(1),'Marker','o','MarkerFaceColor','r','MarkerSize',3*R);
hold off;
 
for cont = 2 : numel(t)
  set(p,'XData',x(cont),'YData',y(cont));
  pause(1e-2)
end

% -------------------------------------------------------------------------

%% Animación de una trayectoria, conociendo la fuerza gravitatoria
% clear;
%close all;

% ---------------- Carga de datos ---------------- 
G  = 6.67408e-11;     % Constante de gravitación universal (m^3 kg^-1 s^-2)
Ms = 1.989e30;        % Masa del Sol                       (kg)
AU = 1.495978707e11/1000;      % Unidad Astronómica        (km)
mu = G*Ms;            % Standard gravitational parameter   (m^3  s^-2)
mu = mu / 1000^3;     % Conversión de unidades             (km^3 s^-2)

% Datos de Afelio
r_af  = 1.017;      % Afelio de la Tierra      (AU)
v_af  = 29300;      % Rapidez en el afelio     (m/s)
v_af  = v_af/1000;  % Conversión de unidades   (km/s)

% Datos de Perihelio
r_pe = 0.98327;     % Perihelio de la Tierra   (AU)
v_pe = 30300;       % Rapidez en el perihelio  (m/s)
v_pe  = v_pe/1000;  % Conversión de unidades   (km/s)
% ---------------- \Carga de datos ---------------- 



Tyr = 3.154*1e7;    % 1 Año, expresado en       (s)
T = 1*Tyr;          %                           (s)

clear N t dt
N = 300;
t = linspace(0,T,N);
dt = t(2)-t(1);


% Inicialización de simulación
r      = zeros(N,2);
r(1,:) = [r_af 0]*AU; %                         (km)

v = zeros(N,2);
v(1,:) = [0 v_af];    %                         (km/s)

a = [0 0];            % aceleración             (km/s^2)

for cont = 1 : N-1
    a = -mu*r(cont,:)/(norm(r(cont,:)))^3;
    v(cont+1,:) = v(cont,:) + a*dt;
    r(cont+1,:) = r(cont,:) + v(cont+1,:)*dt;  % Euler-Cromer
end

figure(3)

plot(r(:,1)/AU,r(:,2)/AU,'-')
hold on;
clear x y
txy = linspace(0,Tyr,9);
x = r_af*cos(2*pi/Tyr * txy);
y = r_pe*sin(2*pi/Tyr * txy);
plot(x,y,'o')
hold off;
xlim([-1 1]*1.2*max(r(:,1))/AU)
ylim([-1 1]*1.2*max(r(:,2))/AU)

line(xlim,[0 0],'LineStyle',':','Color','k')
line([0 0],ylim,'LineStyle',':','Color','k')

axis equal

legend('Trayectoria simulada','Trayectoria esperada')