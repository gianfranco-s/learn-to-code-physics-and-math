clear;
clc;
close all;
clf

dt = .001;
t = 0:dt:4;
x = t.^3;
vx = 3*t.^2;


figure(1)
set(1,'color','w')
plot(t,x)

% Para calcular la velocidad se necesitan sí o sí dos instantes de tiempo
% consecutivos. Tomemos, por ejemplo t = 2 y t = 3. La velocidad entre esos
% puntos es
ta = 2;
tb = 3;

n1 = find(t == ta,1);
n2 = find(t == tb,1);

xa = x(n1);
xb = x(n2);

% % O bien, usando Logical indexing de MATLAB
% xa = x(t == ta);
% xb = x(t == tb);


%%
% Ecuación de la recta que pasa por ambos puntos: y = m*(t-ta)+y_ta
m = (xb-xa)/(tb-ta);
rx = m*(t - ta) + xa;

figure(2)
set(2,'color','w')
plot(t,x,'-',...
    t,rx,'--')

hold on;
plot(ta,xa,'rs','MarkerSize',20)
plot(tb,xb,'ro','MarkerSize',10)
hold off;
axis([0 max(t) 0 max(x)])

%%
% A medida que los puntos se hacen más cercanos (tb-ta) -> 0, la recta rx
% se aproxima a la recta tangente. Tener en cuenta que tb-ta NUNCA es igual
% a cero, por lo que SIEMPRE es una aproximación. Veamos lo que ocurre
% cuando ta = 2 y tb = 2.01

ta = 2.00;
tb = 2.10;

xa = x(t == ta);   % t tiene igual cantidad de elementos que x

% NOTA: "some floating point numbers can not be represented exactly in
% binary form. So that's why you see the very small but not zero result.
% https://matlab.fandom.com/wiki/FAQ#Why_is_0.3_-_0.2_-_0.1_.28or_similar.29_not_equal_to_zero.3F
% La instrucción 
% xb = x(t == 2.1);   % t tiene igual cantidad de elementos que x
% arroja resultado
%     1×0 empty double row vector
% Para evitarlo, elijamos un valor lo suficientemente cercano.
clear tb;
tb = 2.11;
xb = x(t == tb);


m = (xb-xa)/(tb-ta);
rx = m*(t - ta) + xa;

figure(3)
set(3,'color','w')
plot(t,x,'-',...
    t,rx,'--')

hold on;
plot(ta,xa,'rs','MarkerSize',20)
plot(tb,xb,'ro','MarkerSize',10)
hold off;
axis([0 max(t) 0 max(x)])

%% Comparación de tres puntos tb:
clear tb m rx 
tb(1) = ta + 1;
tb(2) = ta + 0.5;
tb(3) = ta + 0.01;
clc
xb(1) = x(t == tb(1));
xb(2) = x(t == tb(2));
xb(3) = x(t == tb(3));

for cont = 1 : 3
    m(cont) = (xb(cont)-xa)/(tb(cont)-ta);
    rx(cont,:) = m(cont)*(t - ta) + xa;
end

figure(4)
set(4,'color','w')
for cont = 1 : 3
    hand(cont) = subplot(1,3,cont);
    plot(t,x,'-',...
        t,rx(cont,:),'--')
    hold on;
    plot(ta,xa,'rs','MarkerSize',20)
    plot(tb(cont),xb(cont),'ro','MarkerSize',10)
    hold off;
    axis([0 max(t) 0 max(x)])
    title(['\Deltat = ' num2str(tb(cont)) ' -2 '])
    xlabel('t')
end

hand(1).YLabel.String = 'x(t)';