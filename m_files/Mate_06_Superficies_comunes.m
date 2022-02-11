
clear
clc
clf
close all

figure('Color','w','Position',[1200 200 600 600])

%--------------------------------------------------------------------------
%------------------------------ Elipsoide ---------------------------------
%--------------------------------------------------------------------------
[x, y, z] = ellipsoid(0,0,0,5.9,3.25,3.25,30);

subplot(2,2,1)
surf(x, y, z)
view(115,25)
axis equal
title('Elipsoide')


%--------------------------------------------------------------------------
%------------------------------- Cilindro ---------------------------------
%--------------------------------------------------------------------------
clear x y z
t = 0:pi/10:2*pi;
[x,y,z] = cylinder(2+cos(t));

subplot(2,2,2)
surf(x,y,z)
view(115,25)
axis square
title('Diavolo Bronco')


%--------------------------------------------------------------------------
%-------------------------------- Esfera ----------------------------------
%--------------------------------------------------------------------------

subplot(2,2,[3 4])
centro = [2 2 -1];
[x,y,z] = sphere;
surf(x+centro(1),y+centro(2),z+centro(3))
axis 'equal'
view(115,25)
LL = 4;
xlim([-2 4]);
ylim([-2 4]);
zlim([-2.5 1]);

title(['Esfera unitaria, centrada en (' num2str(centro),')'])

% Origen de coordenadas
line([0 0],[0 0],zlim,'LineStyle',':','Color',[.5 .5 .5]);
line([0 0],ylim,[0 0],'LineStyle',':','Color',[.5 .5 .5]);
line(xlim,[0 0],[0 0],'LineStyle',':','Color',[.5 .5 .5]);

% Ejes de la esfera
line([centro(1) centro(1)],[centro(2) centro(2)],zlim,'LineStyle','-.','Color',[.5 .5 .5]);
line([centro(1) centro(1)],ylim,[centro(3) centro(3)],'LineStyle','-.','Color',[.5 .5 .5]);
line(xlim,[centro(2) centro(2)],[centro(3) centro(3)],'LineStyle','-.','Color',[.5 .5 .5]);


xlabel('x')
ylabel('y')


