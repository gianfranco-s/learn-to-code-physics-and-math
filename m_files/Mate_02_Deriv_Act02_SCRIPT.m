%% Determinaci�n de la recta tangente obtenida de manera anal�tica.
clear
clc
close all

%% ----------------------- Aproximaci�n elemental ---------------------------
m = -0.679766;
t0 = 1;
f_t0 = -.1;

dt = .01;
t = 0:dt:3;

f = exp(-2*t).*sin(10*t-6);
f_tan = m*(t-t0)+f_t0;

figure(1)
plot(t,f,t,f_tan,t0,f_t0,'o')
title('M�todo elemental')

%% ----------------------- M�todo num�rico ---------------------------
% Una aproximaci�n m�s gen�rica
clear
clc
close all

% Funci�n original:
F_func = @(t) exp(-2*t).*sin(10*t-6);                                     

% df/dt obtenida anal�ticamente
deriv_F_func = @(t) -2*exp(-2*t).*sin(10*t-6) + 10*exp(-2*t).*cos(10*t-6);

% Punto donde se evaluar� la recta tangente
t0 = 1;

% Tiempo de simulaci�n
dt = .01;
t = 0:dt:3;

% Funci�n original y su derivada, evaluadas para todo t.
f = F_func(t);
deriv_f = deriv_F_func(t);

% Ecuaci�n de la recta tangente:
% (f_tan - f_t0) = m*(t - t 0)
f_t0 = F_func(t0)      % Funci�n original evaluada en el punto deseado
m = deriv_F_func(t0)      % df/dt evaluada en el punto t0

f_tan = m*(t - t0) + f_t0;

figure(2)
set(2,'color','w')
plot(t,f,t,f_tan,'--')
axis([0 1.5 -0.5 0.5])
title(['M�todo num�rico: funci�n original y su recta tangente en t_0 = ',...
    num2str(t0)])

%% ----------------------- M�todo simb�lico ---------------------------
syms t_sym
f_sym = exp(-2*t_sym).*sin(10*t_sym-6);
deriv_f_sym = -2*exp(-2*t_sym).*sin(10*t_sym-6) + 10*exp(-2*t_sym).*cos(10*t_sym-6);   % df/dt

f_sym_t0 = subs(f_sym,t0);
m_sym = subs(deriv_f_sym,t0);

disp('f_sym_t0 = ')
disp(double(f_sym_t0))

disp('m_sym = ')
disp(double(m_sym))

f_tan_sym = m_sym*(t_sym-t0) + f_sym_t0;

figure(3)
set(3,'color','w')
%fplot(f_sym,[0 3])
ezplot(f_sym,[0 3])
hold on;
%fplot(f_tan_sym,[0 3],'--')
ez = ezplot(f_tan_sym,[0 3]);
set(ez,'LineStyle','--');
hold off;
axis([0 1.5 -0.5 0.5])
title(['M�todo simb�lico: funci�n original y su recta tangente en t_0 = ',...
    num2str(t0)])


% Los dos m�todos tienen el mismo comportamiento, porque est�n basados en
% la misma ecuaci�n anal�tica.