%% M�todo num�rico:
clear
clc
close all;


%% ---------------------------- M�todo simb�lico ---------------------------- 
syms t_sym

% Funci�n original:
f_sym = exp(-2*t_sym).*sin(10*t_sym-6);

% df/dt obtenida anal�ticamente
deriv_f_sym = -2*exp(-2*t_sym).*sin(10*t_sym-6) + 10*exp(-2*t_sym).*cos(10*t_sym-6);   % df/dt


% Gr�fica de funci�n simb�lica
figure(1)
set(1,'color','w')

subplot(2,1,1)
ezplot(f_sym,[0 3])
% fplot(f_sym,[0 3])            % Funci�n recomendada por MATLAB
title('f(t) simb�lica')
axis([0 3 -.5 1])

subplot(2,1,2)
ezplot(deriv_f_sym,[0 3])
% fplot(deriv_f_sym,[0 3])            % Funci�n recomendada por MATLAB
title('df/dt simb�lica')
axis([0 3 -10 10])

%% ---------------------------- M�todo num�rico ---------------------------- 
% Funci�n original:
F_func = @(t) exp(-2*t).*sin(10*t-6);                                     

% df/dt obtenida anal�ticamente
deriv_F_func = @(t) -2*exp(-2*t).*sin(10*t-6) + 10*exp(-2*t).*cos(10*t-6);

% Tiempo de simulaci�n
dt = .2;
t = 0:dt:3;

% Func�n original, evaluada para todo los valores de t.
f = F_func(t);

% Funci�n derivada con respecto al tiempo (df/dt)
% evaluada para todos los valores de t.
deriv_f = deriv_F_func(t);

% Gr�fica de la funci�n original
figure(2)
set(2,'color','w')

subplot(2,1,1)
plot(t,f,'-o')
title('f(t) num�rica')
axis([0 3 -.5 1])

subplot(2,1,2)
plot(t,deriv_f,'-o')
axis([0 3 -10 10])
title('dft/dt num�rica')

%% ---------------------------- Comparaci�n ---------------------------- 
figure(3)
set(3,'color','w')

subplot(2,1,1)
ezplot(f_sym,[0 3])
hold on;
plot(t,f,'o')
hold off;
title('Comparaci�n entre sustituci�n m�todos num�rico y simb�lico')
axis([0 3 -.5 1])
ylabel('f(t)')
legend('Simb�lico',['Num�rico, dt = ' num2str(dt)])

subplot(2,1,2)

ezplot(deriv_f_sym,[0 3])
hold on;
plot(t,deriv_f,'o')
hold off;
axis([0 3 -10 10])
ylabel('df/dt')
xlabel('t')
title('')

%% ----------------- Determinaci�n de la derivada por software -----------------
%dt = .2;
%t = 0:dt:3;
%f = F_func(t);
%deriv_f = deriv_F_func(t);

deriv_f_sym_soft = diff(f_sym);
deriv_f_soft = diff(f)/dt;

figure(4)
set(4,'color','w')
clf

ez = ezplot(deriv_f_sym,[0 3]);
set(ez,'LineStyle','-');

hold on;
ez = ezplot(deriv_f_sym_soft,[0 3]);
set(ez,'Marker','*','MarkerSize', 5,'LineStyle','none');

plot(t(1:end-1),deriv_f_soft,'o')
hold off;
axis([0 3 -10 10])
title('Comparaci�n de derivadas obtenidas por software')
legend('Derivada anal�tica','Derivada simb�lica',['Derivada num�rica, dt = ' num2str(dt)])
xlabel('t')
ylabel('df/dt')