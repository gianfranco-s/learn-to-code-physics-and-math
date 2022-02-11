%-------------------------------------------------------------- 
% ------------------- Gr�fica de funci�n seno -----------------
%-------------------------------------------------------------- 
 close all;

 %% ******************** Primera aproximaci�n ******************
 z = 0:.1:12;
 k = sin(z);
 figure(1)
 plot(z,k)

 %% ******************** Segunda aproximaci�n ******************
 clear
 clc
 
 T = 2*pi;            % Periodo de la sinusoidal    (s)
 tf = 3*T;            % Tiempo final de simulaci�n  (s)
 t = 0:T/10:tf;       % Arreglo de tiempo           (s)
 w = 2*pi/T;          % Frecuencia de pulsaci�n   (rad/s)
 x = sin(w*t);        % Posici�n lineal             (m)
 
 figure(2)
 plot(t,x)
 
 % Nombre de los ejes y t�tulo
 ylabel('x (m)')
 xlabel('t (s)')
 ax = gca;                   % Handle de "current axes"
 set(ax,'FontSize',12);
 title('Gr�fica de la funci�n seno','FontSize',20)


 %% ******************** Tercera aproximaci�n ******************
 % Cambiando estilos de los ejes
 figure(3)
 plot(t,x)

 % Nombre de los ejes y t�tulo
 ylabel('x (m)')
 xlabel('t (s)')
 title('Gr�fica de la funci�n seno')

 % Nombre de los ejes y t�tulo
 xlim([0 6*pi]);
 xticks([0:pi:tf])
 xticklabels({'0','\pi','2\pi','3\pi','4\pi','5\pi','6\pi'})

 ax = gca;                   % Handle de "current axes"
 set(ax,'FontSize',12);
