
clear;
clc;
close all;

fun = @(x) 3*x.^2;

% Integraci�n con funci�n "integral"
S = integral(fun,-2,2)
dx = .1;
x = -2:dx:2;
f = fun(x);
plot(x,f)

%% Integraci�n simb�lica
syms x_sym
f_sym = 3*x_sym^2;

% Integral simb�lica
primit_f_sym = int(f_sym);

% Valor definido:
S_sym = subs(primit_f_sym,max(x)) - subs(primit_f_sym,min(x))