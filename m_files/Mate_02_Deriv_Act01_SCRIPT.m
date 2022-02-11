%% Método numérico:
clear
clc
close all;


%% ---------------------------- Método simbólico ---------------------------- 
syms t_sym

% Función original:
f_sym = exp(-2*t_sym).*sin(10*t_sym-6);

% df/dt obtenida analíticamente
deriv_f_sym = -2*exp(-2*t_sym).*sin(10*t_sym-6) + 10*exp(-2*t_sym).*cos(10*t_sym-6);   % df/dt


% Gráfica de función simbólica
figure(1)
set(1,'color','w')

subplot(2,1,1)
ezplot(f_sym,[0 3])
% fplot(f_sym,[0 3])            % Función recomendada por MATLAB
title('f(t) simbólica')
axis([0 3 -.5 1])

subplot(2,1,2)
ezplot(deriv_f_sym,[0 3])
% fplot(deriv_f_sym,[0 3])            % Función recomendada por MATLAB
title('df/dt simbólica')
axis([0 3 -10 10])

%% ---------------------------- Método numérico ---------------------------- 
% Función original:
F_func = @(t) exp(-2*t).*sin(10*t-6);                                     

% df/dt obtenida analíticamente
deriv_F_func = @(t) -2*exp(-2*t).*sin(10*t-6) + 10*exp(-2*t).*cos(10*t-6);

% Tiempo de simulación
dt = .2;
t = 0:dt:3;

% Funcón original, evaluada para todo los valores de t.
f = F_func(t);

% Función derivada con respecto al tiempo (df/dt)
% evaluada para todos los valores de t.
deriv_f = deriv_F_func(t);

% Gráfica de la función original
figure(2)
set(2,'color','w')

subplot(2,1,1)
plot(t,f,'-o')
title('f(t) numérica')
axis([0 3 -.5 1])

subplot(2,1,2)
plot(t,deriv_f,'-o')
axis([0 3 -10 10])
title('dft/dt numérica')

%% ---------------------------- Comparación ---------------------------- 
figure(3)
set(3,'color','w')

subplot(2,1,1)
ezplot(f_sym,[0 3])
hold on;
plot(t,f,'o')
hold off;
title('Comparación entre sustitución métodos numérico y simbólico')
axis([0 3 -.5 1])
ylabel('f(t)')
legend('Simbólico',['Numérico, dt = ' num2str(dt)])

subplot(2,1,2)

ezplot(deriv_f_sym,[0 3])
hold on;
plot(t,deriv_f,'o')
hold off;
axis([0 3 -10 10])
ylabel('df/dt')
xlabel('t')
title('')

%% ----------------- Determinación de la derivada por software -----------------
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
title('Comparación de derivadas obtenidas por software')
legend('Derivada analítica','Derivada simbólica',['Derivada numérica, dt = ' num2str(dt)])
xlabel('t')
ylabel('df/dt')