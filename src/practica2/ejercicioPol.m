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