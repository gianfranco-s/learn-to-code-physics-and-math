clear;
clc;
% close all;
clf;

syms x

T = 2*pi;
w = 2*pi/T;
f = cos(x);

%% En x0 = 0;
x0 = 0;
N = 4;
for n = 1 : N
    t(n) = taylor(f,x,x0,'Order',n);
end

figure(1)
set(1,'color','w')

subplot(N+1,1,1)    
%fplot(f,'b')     % en MATLAB
ez = ezplot(f);
set(ez,'LineStyle','-','Color','b')

ylabel('cos(x)')
axis([-T T -2 2])
line(xlim,[0 0],'LineStyle',':','Color',[.5 .5 .5])
line([0 0],ylim,'LineStyle',':','Color',[.5 .5 .5])
title(['Primeras ' num2str(N) ' aproximaciones de Taylor en x0 = '...
    num2str(x0)])

for n = 1 : N
    subplot(N+1,1,n+1)
    %fplot(t(n),'ro-')   % en MATLAB
    ez = ezplot(t(n));
    set(ez,'Color','r','LineStyle','--','LineWidth',2)
    hold on;
    %fplot(f,'b')     % en MATLAB
    ez = ezplot(f);
    set(ez,'LineStyle','-','Color','b')
    hold off;
    axis([-T T -2 2])
    ylabel({'Aprox' ; ['Orden ' num2str(n)]})
    line(xlim,[0 0],'LineStyle',':','Color',[.5 .5 .5])
    line([0 0],ylim,'LineStyle',':','Color',[.5 .5 .5])
    title('')
    xlabel('')

end
xlabel('x')



%% ------------------------------ En x0 ----------------------------------------
x0 = 2;
N = 4;
for n = 1 : N
    t(n) = taylor(f,x,x0,'Order',n);
end

figure(2)
set(2,'color','w')

subplot(N+1,1,1)    
%fplot(f,'b')     % en MATLAB
ez = ezplot(f);
set(ez,'LineStyle','-','Color','b')
ylabel('cos(x)')
axis([-T T -2 2])
line(xlim,[0 0],'LineStyle',':','Color',[.5 .5 .5])
line([0 0],ylim,'LineStyle',':','Color',[.5 .5 .5])

title(['Primeras ' num2str(N) ' aproximaciones de Taylor en x0 = '...
    num2str(x0)])

for n = 1 : N
    subplot(N+1,1,n+1)
    %fplot(t(n))      % en MATLAB
    ez = ezplot(t(n));
    set(ez,'Color','r','LineStyle','--','LineWidth',2)
    hold on;
    %fplot(f,'b')     % en MATLAB
    ez = ezplot(f);
    set(ez,'LineStyle','-','Color','b')
    hold off;
    axis([-T T -2 2])
    ylabel({'Aprox' ; ['Orden ' num2str(n)]})
    line(xlim,[0 0],'LineStyle',':','Color',[.5 .5 .5])
    line([0 0],ylim,'LineStyle',':','Color',[.5 .5 .5])
    title('')
    xlabel('')
end
xlabel('x')