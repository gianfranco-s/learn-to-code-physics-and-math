%% Determinación de la recta tangente obtenida por software
clear
clc
close all;

%% ------------------------ Método numérico ------------------------ 
% Función original:
F_func = @(t) exp(-2*t).*sin(10*t-6);                                     

% Punto donde se evaluará la recta tangente
t0 = 1;

% Tiempo de simulación
dt = .05;
t = 0:dt:3;

% Funcón original, evaluada para todo los valores de t.
f = F_func(t);

% diff(f) devuelve el vector en diferencias. Al dividir por dt, se obtiene
% la derivada.
deriv_f = diff(f)/dt;    

% Ubicación del primer elemento que vale t0 en el vector t.
n = find( t == t0, 1 );

f_t0 = F_func(t0)
deriv_f_t0 = deriv_f(n);
m = deriv_f_t0

f_tan = m * (t-t0) + f_t0;

figure(1)
set(1,'color','w')
plot(t,f,t,f_tan)
axis([0 1.5 -0.5 0.5])
legend('Función original',['Recta tangente en t = ' num2str(t0)])

%% ------------------------ Método simbólico ------------------------ 
syms t_sym
f_sym = exp(-2*t_sym).*sin(10*t_sym-6);
deriv_f_sym = diff(f_sym,t_sym);

f_sym_t0 = subs(f_sym,t0);
m_sym = subs(deriv_f_sym,t0);

disp('f_sym_t0 = ')
disp(double(f_sym_t0))

disp('m_sym = ')
disp(double(m_sym))


f_tan_sym = m_sym*(t_sym - t0) + f_sym_t0;

figure(2)
set(2,'color','w')
%fplot(f_sym,[0 3])          % Sólo en MATLAB
ezplot(f_sym,[0 3])
hold on;
%fplot(f_tan_sym,[0 3],'--') % Sólo en MATLAB
ez = ezplot(f_tan_sym,[0 3]);
set(ez,'LineStyle','--')
hold off;
axis([0 1.5 -0.5 0.5])
title(['Método simbólico: función original y su recta tangente en t_0 = ',...
    num2str(t0 )])

%% Comparación entre ambos métodos
figure(3)
clf
set(3,'color','w')

ezplot(f_sym,[0 3]);
hold on;

plot(t,f_tan,'--')
%fplot(f_tan_sym,[0 3],'o')    %Sólo MATLAB
ez = ezplot(f_tan_sym,[0 3]);
set(ez,'LineStyle','-.');
hold off
title('Comparación entre recta tangente determinada numérica y simbólicamente')
axis([0 3 -.5 1])
legend('Función original',...
       ['Recta tangente numéricacon dt = ' num2str(dt)],...
       'Recta tangente simbólica')
xlabel('t')