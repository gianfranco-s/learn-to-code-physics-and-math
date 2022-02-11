clear;
clc;
clf
% close all;

T = 2*pi;
w = 2*pi/T;
[x,y] = meshgrid(linspace(-2*T,2*T,50));
R = sqrt(x.^2 + y.^2);
z = 5*sin(w*R)./(w*R);

hh = figure(1);
set(hh,'color','w','Position',[700 200 1205 540])
subplot(1,2,1)
surface(x,y,z)
xlabel('x')
ylabel('y')
zlabel('z')
% axis([-T T -2 2 0 5])
axis square
grid
view(3)
title('Gráfica de función sync(x,y) ')

% Curvas de nivel para z = 0.5:
subplot(1,2,2)
nivel_z = 0.5;
contour(x,y,z,[nivel_z nivel_z])
axis square
title(['Curvas de nivel para ' num2str(nivel_z)])
line(xlim,[0 0],'LineStyle',':','Color',[.5 .5 .5])
line([0 0],ylim,'LineStyle',':','Color',[.5 .5 .5])