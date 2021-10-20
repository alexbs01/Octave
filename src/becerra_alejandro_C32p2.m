% Ejercicio 1
## >> x1 = [1 3 4 7.5 8]
## x1 =
##
##   1.0000   3.0000   4.0000   7.5000   8.0000
##
## >> y1 = [-1 6 -2 0 15]
## y1 =
##
##   -1    6   -2    0   15
##
## >> pol_lagr(x1, y1)
##
## Tabla completa de diferencias divididas:
##
##    1.00000   -1.00000    3.50000   -3.83333    0.88278    0.02967
##    3.00000    6.00000   -8.00000    1.90476    1.09048    0.00000
##    4.00000   -2.00000    0.57143    7.35714    0.00000    0.00000
##    7.50000    0.00000   30.00000    0.00000    0.00000    0.00000
##    8.00000   15.00000    0.00000    0.00000    0.00000    0.00000

% Ejercicio 2
 % Codigo
##  evaluacion = [interp1(X, Y, X, 'spline')];
## El vector a evaluar es:
## V =
##
##   1.0000   3.0000   4.0000   7.5000   8.0000
##
##
## Las imagenes del vector a evaluar V son:
## evaluacion =
##
##   -1    6   -2    0   15

% Ejercicio 3
##evaluacion = [interp1(n, t, 25, 'spline')];
##El vector a evaluar es:
##V =  25
##
##Las imagenes del vector a evaluar V son:
##evaluacion =  93.125

% Ejercicio 4
## interp1(X, Y, [1.2 2.9 11.25], 'spline')

% Le dejo aquí la funcion con la que hice los ejercicios
function ejercicioPol(X, Y, V)
  pol_lagr(X, Y)
  evaluacion = [interp1(X, Y, V, 'spline')];
  printf('\n\n **************************************');
  printf('\nEl vector a evaluar es:\n');
  V
  printf('\nLas imagenes del vector a evaluar V son:\n');
  evaluacion
  figure 2;
  hold on;
  plot(interp1(X, Y, X(1):0.1:X(end), 'spline'));
  hold off;
endfunction