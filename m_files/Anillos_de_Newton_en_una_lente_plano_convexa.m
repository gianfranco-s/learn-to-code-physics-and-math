figure(1)
clf
clear

R = 95.2e-2;            % En metros
lambda = 580e-9;        % Longitud de onda en el vacío
N = 2;                  % N: número de anillo brillante
m = N - 1;              % m va de 0 en adelante.


fimplicit(@(x,t) x.^2 + (t - R).^2 - R^2)
line(xlim,[0 0],'LineStyle',':')
line([0 0],ylim,'LineStyle',':')
axis([0 R -R*.1 R])
xlabel('x')
ylabel('t')
title('Sección de la lente')

t_anillo = (m+.5)*lambda*.5        % En metros
x_anillo = sqrt( R^2 - (t_anillo - R)^2)  % En metros
D = 2*x_anillo;
disp(['Diámetro del anillo (en mm): ' num2str(1000*D)])
hold on;
plot(x_anillo,t_anillo,'o')
hold off;

axes('Position',[0.3 0.3 .3 .3])
box on;
xx = 0:x_anillo/10:x_anillo*1.2;
t_xx = R - sqrt(R^2 - xx.^2);
plot(xx,t_xx,x_anillo,t_anillo,'o')
line([x_anillo x_anillo],ylim,'LineStyle','--')
axis([0 x_anillo 0 t_anillo]*1.2)
title('Haciendo zoom, debido a la escala')
