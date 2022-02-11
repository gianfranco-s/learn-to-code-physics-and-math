%-------------------------------------------------------------- 
% ------------------- Gráfica de función seno -----------------
%-------------------------------------------------------------- 
 close all;

 %% ******************** Primera aproximación ******************
 z = 0:.1:12;
 k = sin(z);
 figure(1)
 plot(z,k)

 %% ******************** Segunda aproximación ******************
 clear
 clc
 
 T = 2*pi;            % Periodo de la sinusoidal    (s)
 tf = 3*T;            % Tiempo final de simulación  (s)
 t = 0:T/10:tf;       % Arreglo de tiempo           (s)
 w = 2*pi/T;          % Frecuencia de pulsación   (rad/s)
 x = sin(w*t);        % Posición lineal             (m)
 
 figure(2)
 plot(t,x)
 
 % Nombre de los ejes y título
 ylabel('x (m)')
 xlabel('t (s)')
 ax = gca;                   % Handle de "current axes"
 set(ax,'FontSize',12);
 title('Gráfica de la función seno','FontSize',20)


 %% ******************** Tercera aproximación ******************
 % Cambiando estilos de los ejes
 figure(3)
 plot(t,x)

 % Nombre de los ejes y título
 ylabel('x (m)')
 xlabel('t (s)')
 title('Gráfica de la función seno')

 % Nombre de los ejes y título
 xlim([0 6*pi]);
 xticks([0:pi:tf])
 xticklabels({'0','\pi','2\pi','3\pi','4\pi','5\pi','6\pi'})

 ax = gca;                   % Handle de "current axes"
 set(ax,'FontSize',12);
