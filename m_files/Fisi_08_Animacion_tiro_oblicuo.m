clear all
close all;
clc;

Y0 = 2;
X0 = 3;
V0 = 10;
tita = 30;
tita = 30*pi/180;
A = -9.8;
V0X = V0*cos(tita);
V0Y = V0*sin(tita);


t_vuelo = max(roots([.5*A V0Y Y0]));
t = linspace(0,t_vuelo,20);
y = Y0 + V0Y*t + .5*A*t.^2;
x = X0 + V0X*t;



% -------------------- M�todo 1: actualizar datos del gr�fico ------------------
figure(1)
plot(X0,Y0,'sr',x,y,'k')       % Graficar origen del disparo y trayect completa
axis([0 max(x) 0 max(y)]*1.1)

hold on;
p = plot(x(1),y(1),'o','MarkerFaceColor','red');
hold off;

axis manual

for cont = 2 : numel(t)
  set(p,'XData',x(cont),'YData',y(cont));
  pause(1e-2)
end

%% ver tambi�n
%getframe
%movie

% -------------------- M�todo 2: con "estela" ------------------
figure(2)

plot(X0,Y0,'sr',x,y,'k')      % Graficar origen del disparo y trayect completa
axis([0 max(x) 0 max(y)]*1.1)

hold on;
p = plot(x(1),y(1),'o','MarkerFaceColor','red');
hold off;

% Hasta ac�, todo igual
for cont = 1 : numel(t)
    set(p, 'XData', x(1:cont), 'YData', y(1:cont));
    pause(1e-2)
end


% -------------------- M�todo XX: graficar cada punto con plot ------------------
% Este m�todo es m�s lento, porque plot() realiza varias acciones

%figure(2)
%  %plot(x,y)           % Ver qu� ocurre si se comenta!
%  axis([0 max(x) 0 max(y)]*1.1);
%
%  hold on  
%  for cont = 1 : length(t)
%    %clf                 % Ver qu� ocurre si se comenta!
%    plot(x(cont),y(cont),'o')
%    pause(1e-2)
%  end
%  hold off

% -------------------- M�todo 3: usando refreshdata ------------------
% S�lo actualiza los datos, no permite usar un marcador espec�fico
figure(3)
HH = plot(x,y);
xaux = x(1);
yaux = y(1);

set(HH,'XDataSource','xaux')
set(HH,'YDataSource','yaux')

%plot(X0,Y0,'sr',x,y,'k')      % Graficar origen del disparo y trayect completa
axis([0 max(x) 0 max(y)]*1.1)

hold on;
p = plot(xaux,yaux,'o')%,'o','MarkerFaceColor','red');
hold off;

for cont = 1 : numel(t)
    xaux = x(1:cont);
    yaux = y(1:cont);
    refreshdata
    pause(1e-2)
end
