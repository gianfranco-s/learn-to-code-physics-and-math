clear;
clc;
close all;

% Análisis de la función
% f(x)=(x^2-9)/(x+3)^2 

f = @(t) (t^2-9)/(t+3)^2;

syms x

F_sym = f(x);

% Determinación de dominio (donde la función se hace indefinida
% Valores excluidos del dominio
EXC = solve((x+3)^2 ==0 ,x);

% Puntos críticos (máximos y mínimos)
df_dx = diff(F_sym,x)
% solve(df_dx == 0,x)