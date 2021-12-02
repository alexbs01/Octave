% Becerra Suárez, Alejandro

% Se limpian las variables, la pantalla y se crea la variable simbolica 'x' para
% que se cree la funcion del area sin errores
clear;
clc;
syms x;

% Funcion para calcular el area de revolucion de una funcion que tiene el eje de 
% rotacion en el eje OX
function area = areaRevolucionOX(funcion, x, inicio, final)
    interiorIntegral = funcion*sqrt(1 + (diff(funcion)^2));
    area = 2*pi*int(interiorIntegral, x, inicio, final);
endfunction

% Ejercicio 1 - Volumen de un estanque usando trapecio compuesto a partir de sus areas
    printf("\nCalculo del volumen de un estanque utilizando la aproximacion por trapecio compuesto\n");
    % Creacion de los vectores
        x = 0:2:10;
        area = [0.24 0.07 0.15 0.77 0.93 0.80];
    
    % Calculo del volumen con la funcion trapz
        volumenEstanque = trapz(x, area)

% --------------------------------------------------------    
clear;
syms x;
% --------------------------------------------------------
    
% Ejercicio 2 - Superficio solido de revolucion
    printf("\nCalculo de la superficie de revolucion de la funcion 1/x\n");
    f2 = 1/x;
    
    % Intervalo [1, 2*pi]
        a = 1;
        b = 2*pi;
    
    % Calculo de la superficio con la funcion areaRevolucionOX, y despues 
    % se pasa a formato decimal
    superficieSolidoRevolucion = areaRevolucionOX(f2, x, a, b);
    superficieSolidoRevolucion = double(superficieSolidoRevolucion)
  