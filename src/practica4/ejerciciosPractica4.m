clc;
clear;
syms x t;
warning off;

% Calcula el volumen de revolucion de una funcion que tiene el eje de rotación en OX
function volumen = volumenRevolucionOX(funcion, x, inicio, final)
    interiorIntegral = funcion.^2;
    volumen = pi*int(interiorIntegral, x, inicio, final);
endfunction

function area = areaRevolucionOX(funcion, x, inicio, final)
    interiorIntegral = funcion*sqrt(1 + (diff(funcion)^2));
     area = 2*pi*int(interiorIntegral, x, inicio, final);
endfunction

function valorMedio = aproxValorMedio(funcion, x, a, b)
    valorMedio = (b - a)*subs(funcion, x, (b + a)/2);
endfunction

function aproximacionPuntoMedioCompuesto = puntoMedioTabla(a, b)
    % aproxima meidante punto medio compuesto a|b
    % a de longigtud 2*n + 1 puntos = len(b)
    aMed = a(2:2:length(a));
    bMed = b(2:2:length(b));
    longitudIntervalo = a(2) - a(1);
    aproximacionPuntoMedioCompuesto = 2*longitudIntervalo*sum(bMed);
endfunction

function desigualdad = indiceGini(funcion, x)
    desigualdad = 2*int(x - funcion, x, 0, 1);
endfunction

% Ejercicio 1
    % Definicion de funciones
        e1a = x*exp(x);
        e1c = (t)/(sqrt(t.^2 + 1));

    % Calculo de integrales
        sol1a = int(e1a, x)
        sol1c = int(e1c, t)

% --------------------------------------------------------    
clear;
syms x t; 
% --------------------------------------------------------
        
% Ejercicio 2
    % Definicion de funciones
        e2a = (x + (1)/(x.^(2/3))).^2;
        e2b = sqrt(9 - t.^2);
        e2c = ((cos(exp(x)))/(sin(exp(x))))*exp(x);

    % Calculo de integrales
        sol2a = int(e2a, x, 1, 2)
        sol2b = int(e2b, t, -3, 3)
        sol2c = int(e2c, x, 0, 2)
        
% --------------------------------------------------------    
clear;
syms x; 
% --------------------------------------------------------
 
% Ejercicios 3
    % Definicion de funciones
        curva = sqrt(1 - x.^2);
        oblicua = x;
        
    % Punto de corte
        puntoDeCorte = solve(curva - oblicua, x)
    
    % Calculo de areas
        area1 = int(oblicua, x, 0, puntoDeCorte)    
        area2 = int(curva, x, puntoDeCorte, 1)  
        
        areaTotal = area1 + area2  

% --------------------------------------------------------    
clear;
syms x; 
% --------------------------------------------------------  

% Codigo dado por el profesor  
    figure 1; 
    x = linspace(0,pi/2,25);
    y = sin(x);
    [X,Y,Z] = cylinder(y);
    surf(Z,X,Y)
    xlabel('X'); ylabel('Z'); zlabel('Y');
    
    hold off;

% --------------------------------------------------------    
clear;
syms x; 
% --------------------------------------------------------
   
% Ejercicio 4    
    figure 2;
    hold on;
    
    % Dibuja la esfera exterior
    [X,Y,Z] = sphere(40);
    surf(2*Z, 2*X, 2*Y);
    
    % Dibuja la esfera interior
    [X,Y,Z] = sphere(40);
    surf(X, Y, Z);
    
    esferaGrande = sqrt(4 - x.^2);
    esferaPequena = sqrt(1 - x.^2);
    
    volumenEsferaGrande = volumenRevolucionOX(esferaGrande, x, -2, 2)
    volumenEsferaPequena = volumenRevolucionOX(esferaPequena, x, -1, 1)
    
    volumeAcero = volumenEsferaGrande - volumenEsferaPequena
    xlabel('X'); ylabel('Z'); zlabel('Y');
    axis equal;
    hold off;
    
% --------------------------------------------------------    
clear;
syms x; 
% --------------------------------------------------------
    
% Ejercicio 5
    x = linspace(1,10,50);
    trompetaTorricelli = x.^-1;
    figure 5;
    hold on;
    
    [X, Y, Z] = cylinder(trompetaTorricelli);
    surf(Z, X, Y);
    xlabel('X'); ylabel('Y'); zlabel('Z');
    
    syms x; % Volvemos a convertir la 'x' en simbolico para hacer las integrales
    trompeta = x.^-1;
    volumenTrompeta = volumenRevolucionOX(trompeta, x, 1, inf) % Calcula el volumen
    areaTrompeta = areaRevolucionOX(trompeta, x, 1, inf) % Calcula el area
    
% --------------------------------------------------------    
clear;
syms x; 
% --------------------------------------------------------

% Ejercicio 6
    f6 = x*sqrt(16-x.^2)
    aproximacionPorValorMedio = aproxValorMedio(f6, x, 0, 4)
    calculoIntegralFormaDirecta = int(f6, x, 0, 4)

% --------------------------------------------------------    
clear;
syms x n; 
% --------------------------------------------------------

% Ejercicio 7
    f7 = x*sqrt(16-x.^2)
    %funcionIntervalo = 10.^n + 1;
    
    aproximacion1 = double(trapz(linspace(0, 4, 11), subs(f7, x, linspace(0, 4, 11))))
    aproximacion2 = double(trapz(linspace(0, 4, 101), subs(f7, x, linspace(0, 4, 101))))
    % aproximacion3 = double(trapz(linspace(0, 4, 1001), subs(f7, x, linspace(0, 4, 1001))))
    % aproximacion4 = double(trapz(linspace(0, 4, 10001), subs(f7, x, linspace(0, 4, 10001))))
    % aproximacion5 = double(trapz(linspace(0, 4, 100001), subs(f7, x, linspace(0, 4, 100001))))
    % Solo 2 que si no mi ordenador peta
    
% --------------------------------------------------------    
clear;
syms x %n particiones i; 
% --------------------------------------------------------

% Ejercicio 8
    f8 = @(x) x*sqrt(16-x.^2)
    puntos = @(n) 10.^n + 1;
    
    a = linspace(0, 4, puntos(1))
    b = subs(f8, x, a)
    puntoMedioTabla(a, b)
    
% --------------------------------------------------------    
clear;
syms x;
% --------------------------------------------------------

% Ejercicio 1 del Índice de Gini

indiceGiniConL1 = double(indiceGini(x.^2.32, x))
indiceGiniConL2 = double(indiceGini(x.^3.1, x))

% Ejercicio 2 del Índice de Gini

xi = 0:0.1:1;
L = [0 0.0001 0.0016 0.0243 0.0256 0.0625 0.1296 0.2401 0.4096 0.6561 1.0];

f2 = xi - L;

aproximacionTrapacioCompuesto = 2*trapz(xi, f2)
aproximacionValorMedioCompuesto = 2*puntoMedioTabla(xi, f2)



