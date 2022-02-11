clear;
clc;
close all;

% An�lisis de la funci�n
% f(x)=(x^2-9)/(x+3)^2 

f = @(t) (t^2-9)/(t+3)^2;

syms x

F_sym = f(x);

% Determinaci�n de dominio (donde la funci�n se hace indefinida
% Valores excluidos del dominio
EXC = solve((x+3)^2 ==0 ,x);

% Puntos cr�ticos (m�ximos y m�nimos)
df_dx = diff(F_sym,x)
% solve(df_dx == 0,x)