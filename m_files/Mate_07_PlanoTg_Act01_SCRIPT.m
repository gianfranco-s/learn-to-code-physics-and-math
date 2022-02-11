clear;
clc;
close all;

% https://la.mathworks.com/help/matlab/math/calculate-tangent-plane-to-surface.html?lang=en

% Definición de la función
f = @(x,y) x.^2 + y.^2;

% Dominio de la función
DD = .25;
[xx,yy] = meshgrid(-5:DD:5);

% dfx y dfy son las aproximaciones numéricas del gradiente en todo el
% dominio.
[dfx,dfy] = gradient(f(xx,yy),DD);

% Punto en que se desea graficar el plano tangente
x0 = 1;
y0 = 2;

% xx == x0: devuelve TRUE en todos los puntos de xx que tienen valor x0.
% Análogo para yy == y0. La interseccion entre ambos valores se guarda en t

t = (xx == x0) & (yy == y0);
indt = find(t);  % Devuelve el número de índice en que se encuentran x0 e y0

% Determinar el gradiente en dicho índice
dfx0 = dfx(indt);
dfy0 = dfy(indt);

% Definición del plano tangente.
z = @(x,y) f(x0,y0) + dfx0*(x-x0) + dfy0*(y-y0);

hh = figure(1);
set(hh,'color','w','Position',[1920*.4 1080*.5 1920*.5 1080*.4])
subplot(1,2,1)
surf(xx,yy,f(xx,yy),'EdgeAlpha',0.7,'FaceAlpha',0.9)
view(-40,15)
hold on
surf(xx,yy,z(xx,yy))
hold off;

subplot(1,2,2)
surf(xx,yy,f(xx,yy),'EdgeAlpha',0.7,'FaceAlpha',0.9)
hold on
surf(xx,yy,z(xx,yy))
plot3(1,2,f(1,2),'r*')
view(-135,9)
hold off;

%% ---------------------- Con matemática simbólica ------------------------

pkg load symbolic;

syms x y;
z = 2*x+4*y-5;
f = x^2+y^2;

hh = figure(2);
set(hh,'color','w','Position',[1920*.5 1080*.05 1920*.5 1080*.4])
subplot(1,2,1)
hold on;
ezsurf(f);
ezsurf(z);
hold off;
view(3)

subplot(1,2,2)
hold on;
ezsurf(f);
ezsurf(z);
hold off;
view(-135,13)
