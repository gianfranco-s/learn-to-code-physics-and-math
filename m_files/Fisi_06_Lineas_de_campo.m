clear
clc
close all


q = [ +1e-9 ;
      -1e-9 ;
      +1e-9 ;
      +1e-9 ];
  
r = [ 1  1 ;
     -1  1 ;
     -1 -1 ;
      1 -1 ];

k = 9e9;

DD = .25;
MAX = 5;
[x,y] = meshgrid(-MAX:DD:MAX);

% -------------------------------------------------------------------------
% L�neas de campo de una carga
% -------------------------------------------------------------------------
E = zeros(size(x));

N = 1;
R = sqrt((x-r(N,1)).^2+(y-r(N,2)).^2);
E = k*q(N)./R.^2;

E_TOPE = 100;
E(E>E_TOPE) = E_TOPE;
E(E<-E_TOPE) = -E_TOPE;

figure('Name','Carga única','Color','white','Position',[960 80 950 900])
subplot(2,2,1)
surf(x,y,E)
title('Magnitud del campo eléctrico')
xlim([-1 3])
ylim([-1 3])
xlabel('x')
ylabel('y')


subplot(2,2,2)
contour(x,y,E,E_TOPE*(-1:.05:1))
[dx,dy] = gradient(-E,DD);   % Se toma -E, para que las líneas de campo
                             % sigan la convención, y "salgan" de la carga

hold on;
quiver(x,y,dx,dy)
hold off;
title('Líneas de campo y curvas de igual campo eléctrico')
axis([-1 3 -1 3])

% ------------------------- Potencial el�ctrico ---------------------------
% Yendo por el otro lado, en base al potencial, determinar las l�neas de
% campo el�ctrico:

V = k*q(N)./R;

V_TOPE = sqrt(E_TOPE);
V(V>V_TOPE) = V_TOPE;
V(V<-V_TOPE) = -V_TOPE;

subplot(2,2,3)
surf(x,y,V)
title('Potencial eléctrico')
xlabel('x')
ylabel('y')
zlabel('V')

subplot(2,2,4)

[Evx, Evy] = gradient(-V,DD);  % Evx y Evy son las componentes de campo 
                               % Eléctrico obtenidas a partir de V

contour(x,y,V,V_TOPE*(-1:.05:1))
hold on;
quiver(x,y,Evx,Evy)
hold off;
title('Líneas de campo y curvas equipotenciales')
axis([-1 3 -1 3])

allAxesInFigure = findall(gcf,'type','axes');
set(allAxesInFigure,'FontSize',14)

%% ------------------------------------------------------------------------
% L�neas de campo de 2 cargas
% -------------------------------------------------------------------------
clear E
E = zeros(size(x));

for N = 1 : 2
    R = sqrt((x-r(N,1)).^2+(y-r(N,2)).^2);
    E = E + k*q(N)./R.^2;
end


E_TOPE = 100;
E(E>E_TOPE) = E_TOPE;
E(E<-E_TOPE) = -E_TOPE;

figure('Name','Dos cargas','Color','white','Position',[960 80 950 900])
subplot(2,2,1)
surf(x,y,E)
title('Magnitud del campo eléctrico')
ylim([-1 3])
xlabel('x')
ylabel('y')

subplot(2,2,2)
contour(x,y,E,E_TOPE*(-1:.05:1))
[dx,dy] = gradient(-E,DD);   % Se toma -E, para que las l�neas de campo
                             % sigan la convenci�n, y "salgan" de la carga

% Para que las "flechitas" de quiver tengan todas el mismo largo:
dx_norm = dx./sqrt(dx.^2+dy.^2);  % Normalizaci�n del vector dx
dy_norm = dy./sqrt(dx.^2+dy.^2);  % Normalizaci�n del vector dx

hold on;
quiver(x,y,dx_norm,dy_norm,.5)   % .5 permite escalar al 50% el largo de las flechas
hold off;
title('Líneas de campo y curvas de igual campo eléctrico')
axis([-MAX MAX -MAX MAX]*.5)

% ------------------------- Potencial el�ctrico ---------------------------
% Yendo por el otro lado, en base al potencial, determinar las l�neas de
% campo el�ctrico:

clear V
V = zeros(size(x));

for N = 1 : 2
    R = sqrt((x-r(N,1)).^2+(y-r(N,2)).^2);
    V = V + k*q(N)./R;
end

V_TOPE = 40;
V(V>V_TOPE) = V_TOPE;
V(V<-V_TOPE) = -V_TOPE;

subplot(2,2,3)
surf(x,y,V)
title('Potencial eléctrico')
xlabel('x')
ylabel('y')
zlabel('V')

subplot(2,2,4)
[Evx, Evy] = gradient(-V,DD);  % Evx y Evy son las componentes de campo 
                               % El�ctrico obtenidas a partir de V

contour(x,y,V,V_TOPE*(-1:.05:1))
hold on;
quiver(x,y,Evx,Evy)
hold off;
title('Líneas de campo y curvas equipotenciales')
axis([-MAX MAX -MAX MAX]*.5)

allAxesInFigure = findall(gcf,'type','axes');
set(allAxesInFigure,'FontSize',14)

%%
% -------------------------------------------------------------------------
% L�neas de campo de 4 cargas en cuadrado
% -------------------------------------------------------------------------
clear E
E = zeros(size(x));

q = [ +1e-9 ;
      +1e-9 ;
      +1e-9 ;
      +1e-9 ];
  
r = [ 1  1 ;
     -1  1 ;
     -1 -1 ;
      1 -1 ];


for N = 1 : 4
    R = sqrt((x-r(N,1)).^2+(y-r(N,2)).^2);
    E = E + k*q(N)./R.^2;
end
E_TOPE = 100;
E(E>E_TOPE) = E_TOPE;
E(E<-E_TOPE) = -E_TOPE;

figure('Name','Cuatro cargas','Color','white','Position',[960 80 950 900])
subplot(2,2,1)
surf(x,y,E)
title('Magnitud del campo eléctrico')

subplot(2,2,2)
contour(x,y,E,E_TOPE*(-1:.05:1))
[dx,dy] = gradient(-E,DD);   % Se toma -E, para que las l�neas de campo
                             % sigan la convenci�n, y "salgan" de la carga

hold on;
quiver(x,y,dx,dy)
hold off;
title('Líneas de campo')
axis([-MAX MAX -MAX MAX]*.5)

% ------------------------- Potencial el�ctrico ---------------------------
% Yendo por el otro lado, en base al potencial, determinar las l�neas de
% campo el�ctrico:

clear V;
V = zeros(size(x));

for N = 1 : 4
    R = sqrt((x-r(N,1)).^2+(y-r(N,2)).^2);
    V = V + k*q(N)./R;
end

V_TOPE = 40;
V(V>V_TOPE) = V_TOPE;
V(V<-V_TOPE) = -V_TOPE;

subplot(2,2,3)
surf(x,y,V)
title('Potencial eléctrico')
xlabel('x')
ylabel('y')
zlabel('V')

subplot(2,2,4)
[Evx, Evy] = gradient(-V,DD);  % Evx y Evy son las componentes de campo 
                               % El�ctrico obtenidas a partir de V

contour(x,y,V,V_TOPE*(-1:.05:1))
hold on;
quiver(x,y,Evx,Evy)
hold off;
title('Líneas de campo y curvas equipotenciales')
axis([-MAX MAX -MAX MAX]*.5)

allAxesInFigure = findall(gcf,'type','axes');
set(allAxesInFigure,'FontSize',14)