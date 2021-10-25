function pol_lagr(X, Y)
% función que obtiene la expresión del polinomio de Lagrange dados los vectores de las 
% componentes de los nodos de interpolación
% 
% pol_lagr(X, Y) tiene dos argumentos:
% X es el vector de las abscisas de los nodos
% Y es el vector de las ordenadas de los nodos
%
% Octubre 2021
% 
n = length(X); % número de nodos
M = zeros(n, n+1); % matriz nula de tantas filas como nodos 
% el número de columnas es el de la tabla de diferencias divididas
% incluyendo la columna de las abscisas de los nodos 
M(:, 1) = X; % primera columna de M está formada por las abscisas de los nodos
M(:, 2) = Y; % segunda columna de M está formada por las ordenadas de los nodos
% 
% Diferencias divididas de primer orden
%
dd = diff(Y)./diff(X); % equivale a la orden dd = diff(M(:, 2))./diff(M(:, 1))
M(:,3)=[dd,0]'; % tercera columna de M. Está formada por las diferencias divididas 
% de primer orden. Se completa en la última fila con un cero
% 
% Restantes columnas de la tabla de diferencias divididas
% 
for k = 4:n + 1
dd = diff(dd)./(X(k - 1:n) - X(1:n - k + 2)); % n - k +2 = n - (k - 2)
%en el paso k se forman las diferencias divididas de orden k - 2
M(:, k)=[dd'; zeros(k - 2, 1)]; %columna k-ésima de la matriz M
endfor
%
disp(' ');
disp('Tabla completa de diferencias divididas: ');
disp(' ');
disp(M);
disp(' ');
%
% Coeficientes de la expresión de Newton del polinomio de Lagrange
%
coef = M(1,[2:n+1]); % Primera fila de la matriz M. (a partir de la segunda columna). 
% La forman la primera componente de Y y las diferencias divididas que 
% aparecen en la expresión del polinomio de Lagrange
disp('');
disp('Los coeficientes de la fórmula de Newton son (primera fila de la tabla desde Y(1)): ')
disp('');
disp(coef);
disp('')
%
% Finalmente usamos symbolic para obtener la expresión del polinomio
pkg load symbolic;
warning off; 
%
syms x;
%
monomios = x - X(1:n-1); % monomios que aparecen en la expresión 
% del polinomio de Lagrange
aux_0 = zeros(1, n - 1); aux = sym('aux_0'); % aux es ahora un vector nulo simbólico
for k =1: n-1 
aux(k) = prod(monomios(1:k)); % prod calcula el producto de las componentes del
% vector monomios desde la primera a la k-esima.
endfor
pol = expand(coef(1) + sum(coef(2:n).*aux(1:n-1))); 
% las lineas de la 52 a la 59 equivalen las lineas de la 61 a la 64 (comentadas)
% pol = x.^0.*coef(n); 
% for k = n:-1:2
% pol = expand(pol.*(x-X(k-1))+coef(k-1)); 
% endfor
disp('El polinomio de Lagrange es:')
disp('')
disp(pol);% Fórmula de Newton del polinomio de Lagrange
%
% Representacion grafica del polinomio resaltando los nodos de interpolacion
%
ezplot(pol, sym([X(1) - 0.2, X(n) + 0.2])) % representamos el polinomio obtenido
hold on;
plot(X, Y, '*') % resaltamos con asteriscos los nodos de interpolacion
hold off;
endfunction