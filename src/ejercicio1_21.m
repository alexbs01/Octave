% Representa gráficamente el coseno de un ángulo tita de 0 a 2PI a saltos de 1/8. Etiqueta los ejes y
% ponle un título. Dibuja, conjuntamente con el coseno, la recta horizontal que pasa por el valor
% más alto que toma la función coseno en el intervalo [0, 2PI]. Es decir, la recta tangente a la gráfica
% del coseno en el punto donde el coseno alcanza su valor máximo. Dibuja esta recta en otro color
% y otro trazado. Crea una leyenda identificativa de cada una de las dos funciones dibujadas.

x = 0:1/8:2*pi;

y1 = cos(x);
plot(x, y1);
hold on;

plot(0:0.01:2*pi, y=1, 'g');

title("Funcion del ejercicio 1.21");
xlabel("Este es el eje X");
ylabel("Este es el eje Y");
legend("Esta es la funcion coseno");
legend('Funcion coseno', 'Estas es la funcion y = 1');

hold off;