clear all
close all;
clc;


t = 0:.1:2*pi;
x = sin(t);

 % Recorrer una trayectoria preestablecida
  figure(1)
  axis([0 max(t) min(x) max(x)]*1.1);
%  axis manual
  for cont = 1 : length(t)
    %clf                 % Ver qué ocurre si se comenta!
    %plot(t,x)           % Ver qué ocurre si se comenta!
    hold on
    plot(t(cont),x(cont),'o')
    pause(.001)
  end
  hold off


% Otra opción: ir llenando el array de salida y graficando, punto por punto.
clear
clc

figure(2)
axis([0 360 -1 1]);
axis manual

hold on
for t = 0 : 5 : 360
  y = sind(t);
  plot(t,y,'o')
  pause(.001)
end
hold off

% ------ Actualizar posición de los datos, en vez de usar nuevamente plot ------
% No se puede ver la "estela"
clear;
clc;
x = 0:.1:2*pi;
y = sin(x);

figure(3)
axis([0 2*pi -1 1])

plot(x,y)
hold on;
p = plot(x(1),y(1),'o','MarkerFaceColor','red');
hold off;

axis manual
  
for cont = 2 : numel(x)
  set(p,'XData',x(cont),'YData',y(cont));
  pause(.01)
end

%%ver también
%getframe
%movie