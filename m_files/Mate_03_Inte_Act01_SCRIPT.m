% Integrar f(x) = 1 + x^2 entre x1 = 0 y x2 = 5
clear;
clc;
close all;
clf

x1 = 0;
x2 = 5;

% Suma de Riemann, o aproximación numérica de la integral. Hay varias

% N: cantidad de sumas
N = 4;

% f = @(xx) exp(xx.^2);
f = @(xx) 1 + xx.^2;

% Método numérico de MATLAB
QQ = integral(f,x1,x2);       % Valor integral "verdadero"

% Método simbólico de MATLAB
syms xsym
Fsym = int(1 + xsym^2);
QQsym = subs(Fsym,x2) - subs(Fsym,x1);


% Datos para la función "verdadera"
t = linspace(x1,x2,1000);
fverdadera = f(t);

% Función aproximada
x = linspace(x1,x2,N+1);

% Separación entre muestras:
DX = x(2) - x(1);

%% Aproximación de punto medio
% X[i]* = ( X[i] + X[i+1] ) / 2
Xmed = zeros(1,N);

for cont = 1 : N
    Xmed(1,cont) = (x(cont) + x(cont+1))/2;
end

fmed = f(Xmed);
Smed = sum(fmed)*DX;   % Suma del valor de f evaluado en cada Xmed
disp('Aproximación de punto medio')
disp(Smed)

% hh = figure(1);
% set(hh,'color','w');
% clf
% 
% % Rectángulos de área
% subplot(1,2,1)
% for cont = 1: N
%    rectangle('Position',[Xmed(cont)-DX/2 0 DX fmed(cont)],...
%        'FaceColor','cyan','LineWidth',1,'LineStyle',':')
% end
% 
% subplot(1,2,2)
% for cont = 1 : N
%     hold on;
%     fill([Xmed(cont)-DX/2  Xmed(cont)-DX/2  Xmed(cont)+DX/2  Xmed(cont)+DX/2],...
%          [      0            fmed(cont)        fmed(cont)             0     ],...
%           'cyan','LineWidth',1,'LineStyle','none','FaceAlpha',.5,...
%           'HandleVisibility','off') % Esta última parta es para evitar etiquetas
%     hold off;
% end
% hold on;
% plot(t,fverdadera,'k-');
% stem(Xmed,fmed,'r--')
% hold off;
% xlabel('x')
% ylabel('f(x)')
% legend('Función verdadera','Aproximación de punto medio')
% title({['Suma aproximada: ' num2str(Smed)]; ['Error: ' num2str(QQ-Smed)]})


%% Aproximación de lado izquierdo 
% X[i]* = X[i]
Xizq = zeros(1,N);

for cont = 1 : N
    Xizq(1,cont) = x(cont);
end

fizq = f(Xizq);
Sizq = sum(fizq)*DX;   % Suma del valor de f evaluado en cada Xmed
disp('Aproximación de lado izquierdo')
disp(Sizq)

% hh = figure(2);
% set(hh,'color','w');
% clf
% 
% % Rectángulos de área
% subplot(1,2,1)
% for cont = 1: N
%    rectangle('Position',[Xizq(cont) 0 DX fizq(cont)],...
%        'FaceColor','cyan','LineWidth',1,'LineStyle',':')
% end
% 
% 
% subplot(1,2,2)
% for cont = 1 : N
%     hold on;
%     fill([Xizq(cont) Xizq(cont)  Xizq(cont)+DX   Xizq(cont)+DX],...
%          [   0       fizq(cont)   fizq(cont)        0       ],...
%           'cyan','LineWidth',1,'LineStyle','none','FaceAlpha',.5,...
%           'HandleVisibility','off') % Esta última parta es para evitar etiquetas
%     hold off;
% end
% 
% hold on;
% plot(t,fverdadera,'k-');
% stem(Xizq,fizq,'r--')
% hold off;
% xlabel('x')
% ylabel('f(x)')
% legend('Función verdadera','Aproximación de lado izquierdo')
% title({['Suma aproximada: ' num2str(Sizq)]; ['Error: ' num2str(QQ-Sizq)]})

%% Aproximación de trapecio
% ftra = ( f(i+1)+f(i) ) / 2
Xtra = x(1:end-1);
fx = f(x);  % N+1 elementos
% ftra = zeros(1,N);

for cont = 1 : N
    ftra(1,cont) = ( fx(cont+1) + fx(cont) )/2;
end


Stra = sum(ftra)*DX;   % Suma del valor de f evaluado en cada Xmed
disp('Aproximación de lado izquierdo')
disp(Stra)

% hh = figure(3);
% set(hh,'color','w');
% 
% 
% hold on;
% p(1) = plot(t,fverdadera,'k-');
% p(2) = stem(Xtra,fx(1:end-1),'r--');
% hold off;
% xlabel('x')
% ylabel('f(x)')
% legend('Función verdadera','Aproximación de trapecios')
% title({['Suma aproximada: ' num2str(Stra)]; ['Error: ' num2str(QQ-Stra)]})
% 
% for cont = 1 : N
%     hold on;
% %     patch([x(cont)  x(cont)   x(cont+1)   x(cont+1)],...
% %           [   0    fx(cont)  fx(cont+1)      0     ],...
% %           'cyan','LineWidth',1,'LineStyle',':')
%     fill([x(cont)  x(cont)   x(cont+1)   x(cont+1)],...
%           [   0    fx(cont)  fx(cont+1)      0     ],...
%           'cyan','LineWidth',1,'LineStyle',':','FaceAlpha',.5,...
%           'HandleVisibility','off') % Esta última parta es para evitar etiquetas
%     hold off;
% end

%% Comparación

hh = figure(1);
set(hh,'Name','Sumas aproximadas','Color','white','Position',[960 80 950 900]);
clf

subplot(1,3,1)
% Rectángulos de área
for cont = 1 : N
    hold on;
    fill([Xmed(cont)-DX/2  Xmed(cont)-DX/2  Xmed(cont)+DX/2  Xmed(cont)+DX/2],...
         [      0            fmed(cont)        fmed(cont)             0     ],...
          'cyan','LineWidth',1,'LineStyle','none','FaceAlpha',.5,...
          'HandleVisibility','off') % Esta última parta es para evitar etiquetas
    hold off;
end

hold on;
plot(t,fverdadera,'k-');
stem(Xmed,fmed,'r--')
hold off;
xlabel({'x';'(a) Aproximación de punto medio'})
ylabel('f(x)')
title({ ['Suma aproximada: ' num2str(Smed)] ;...
        ['Error: ' num2str(QQ-Smed)]})

subplot(1,3,2)
% Rectángulos de área
for cont = 1 : N
    hold on;
    fill([Xizq(cont) Xizq(cont)  Xizq(cont)+DX   Xizq(cont)+DX],...
         [   0       fizq(cont)   fizq(cont)        0       ],...
          'cyan','LineWidth',1,'LineStyle','none','FaceAlpha',.5,...
          'HandleVisibility','off') % Esta última parta es para evitar etiquetas
    hold off;
end

hold on;
plot(t,fverdadera,'k-');
stem(Xizq,fizq,'r--')
hold off;
xlabel({'x';'(b) Aproximación de lado izquierdo'})
title({ ['Suma aproximada: ' num2str(Sizq)] ;...
        ['Error: ' num2str(QQ-Sizq)]})

subplot(1,3,3)
hold on;
p(1) = plot(t,fverdadera,'k-');
p(2) = stem(Xtra,fx(1:end-1),'r--');
hold off;
xlabel({'x';'(c) Aproximación de trapecios'})
title({ ['Suma aproximada: ' num2str(Stra)] ;...
        ['Error: ' num2str(QQ-Stra)]})

for cont = 1 : N
    hold on;
%     patch([x(cont)  x(cont)   x(cont+1)   x(cont+1)],...
%           [   0    fx(cont)  fx(cont+1)      0     ],...
%           'cyan','LineWidth',1,'LineStyle',':')
    fill([x(cont)  x(cont)   x(cont+1)   x(cont+1)],...
          [   0    fx(cont)  fx(cont+1)      0     ],...
          'cyan','LineWidth',1,'LineStyle','None','FaceAlpha',.5,...
          'HandleVisibility','off') % Esta última parta es para evitar etiquetas
    hold off;
end

allAxesInFigure = findall(gcf,'type','axes');
set(allAxesInFigure,'FontSize',14)