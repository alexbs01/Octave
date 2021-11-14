% Ejercicios de las pr�cticas 3 de Octave
% Becerra Su�rez, Alejandro - Grupo 3.2
% GNU Octave Version: 5.1.0
% symbolic Version: 2.8.0
clear;
clc;
pkg load symbolic;
syms x;

% Crea los ejes de coordenadas
function y = ejes()
    plot([-1000,1000], [0, 0], "k"); % Eje OX
    plot([0, 0], [-1000, 1000], "k") ;  % Eje OY
endfunction

% Calcula los puntos de corte con los ejes
function solucionesFunciones(funcion, x)
    syms x;
    corteX = solve(funcion);
    corteY = limit(funcion, x, 0);
    
    printf("Existen puntos de corte con OX en ");
    corteX
    
    printf("\nExiste punto de corte con OY en ")
    corteY
endfunction  

% Calula las asintotas horizontales comprobando el l�mite cuando x tiende a + o - infinito
function y = asintotasH(funcion, x)
    asintotaHorizontalPos = limit(funcion, x, inf)
    plot([-10, 10], [sym2poly(asintotaHorizontalPos), sym2poly(asintotaHorizontalPos)], "g--"); % Dibujo de la asintota horizontal
    asintotaHorizontalNeg = limit(funcion, x, -inf)
    plot([-10, 10], [sym2poly(asintotaHorizontalNeg), sym2poly(asintotaHorizontalNeg)], "g--"); % Dibujo de la asintota horizontal
    if(asintotaHorizontalPos != inf || asintotaHorizontalNeg != inf)
        printf("\nComo tiene al menos una asintota horizontal, no tendra oblicuas\n");
    endif
endfunction

% Calcula la as�ntota oblicua y la debuja utilizando su ecuaci�n de la recta tangente
function y = asintotaObli(funcion, x)
    m = limit(funcion/x, x, inf)
    n = limit((funcion - m*x), x, inf)
    rectaOblicua = m*x + n
    ezplot(rectaOblicua, [-10, 10]);
endfunction

% Calcula las as�ntotas verticales (solo sirve con funcionces racionales), resuelve el denominador y hace
% el limite cuando x tiende a esos valores
function y = asintotasVert(funcion, x)
    denominadorFuncion = (funcion / numden(funcion))^-1; % Obtiene el denominador de la funci�n
    resultadoDenominador = solve(denominadorFuncion)
    for i = 1:length(resultadoDenominador);
        asintotaVertical = limit(funcion, x, resultadoDenominador(i));
        if(asintotaVertical == inf || asintotaVertical == -inf)
            plot([sym2poly(resultadoDenominador(i)), sym2poly(resultadoDenominador(i))], [-100, 100], "r--");
        endif
    endfor
endfunction

% Realiza el m�todo de Newton-Raphson especificando el un n�mero de iteraciones
function y = metodoNR(funcion, x, inicio, iteraciones)
    syms x0;
    funcionNR = x0 - (subs(funcion, x, sym(x0)))/(subs(diff(funcion), x, sym(x0)));
    syms xn;
    xn = subs(funcionNR, x0, inicio);
    for i = 1:length(iteraciones)+1
        format long;
        printf("\nSolucion de la iteracion %d: \n", i)
        double(xn)
        xn = subs(funcionNR, x0, xn);
    endfor
endfunction

% Realiza el m�todo de dicotom�a especificando un itervalo y un error m�nimo
function y = dicotomia(funcion, x, extIzq, extDe, errorMinimo)
    iteracion = 1;
    do
        imagenExtIzq = subs(funcion, x, extIzq);   
        imagenExtDe = subs(funcion, x, extDe);
        puntoMedio = (extDe + extIzq)/2;
        imagenPuntoMedio = subs(funcion, x, puntoMedio);
        productoIntervaloIzquierdo = imagenExtIzq * imagenPuntoMedio;
        productoIntervaloDerecho = imagenExtDe * imagenPuntoMedio;
        if(productoIntervaloIzquierdo < 0)
            printf("\nLa solucion %.f est� en el intervalo [%f, %f]\n", iteracion, double(extIzq), double(puntoMedio));
            error = abs(puntoMedio - extIzq)
            extDe = puntoMedio;
        elseif(productoIntervaloDerecho < 0)
            printf("\nLa solucion %.f est� en el intervalo [%f, %f]\n", iteracion, double(puntoMedio), double(extDe));
            error = abs(extDe - puntoMedio)
            extIzq = puntoMedio;
        elseif(productoIntervaloIzquierdo == 0 || productoIntervaloDerecho == 0)
            printf("La soluci�n %d es x = %f\n", iteracion, puntoMedio)
            error = 0
        endif
        iteracion = iteracion + 1;
    until(error <= errorMinimo)
endfunction

% Ejercicio 1
    % Apartado A
        printf("Ejercicio 1\n");
        printf("Apartado A\n");
        f1 = (x.^2 - 9)/(x.^2 - 4);
        solucionesFunciones(f1, x);
        
        figure 1;
        ezplot(f1, [-10,10]);
        axis([-10 10 -3 6]);
        hold on;
      
      % Ejes de coordenadas
         ejes();
    
    % Apartado B
        printf("\n##############\n");
        printf("\nApartado B\n");
        % Calculo de asintotas
            asintotasVert(f1, x);
    
    % Apartado C
        printf("\n##############\n");
        printf("\nApartado C\n");
    
        asintotasH(f1, x);
        hold off;
  
% ----------------------------------------------------

clear % Eliminacion de variables para que no haya problemas futuros
syms x;

% ----------------------------------------------------

% Ejercicio 2
    printf("\n------------------------------------------------------------------------------------------------------\n");
    printf("\nEjecicio 2\n");
    
    figure 2;
    f2 = (exp(x) + exp(-x))/(exp(x) - exp(-x));
    
    % Dibuja la funci�n y sus asintotas horizontales asintota horizontal
      ezplot(f2, [-10, 10]);
      hold on;
      ejes();
      asintotasH(f2, x);
    
    % Asintota vertical
      asintotasVert(f2, x);
      hold off;
    
% ----------------------------------------------------

clear
syms x;

% ----------------------------------------------------

% Ejercicio 3
    printf("\n------------------------------------------------------------------------------------------------------\n");
    printf("\nEjercicio 3\n");
    
    f3 = (x.^3 - 9)/(x.^2 - 16);
    
    % Apartado A
        printf("Apartado A\n");
        denominadorFuncion = (f3 / numden(f3))^-1
        
        printf("La funcion al ser racional es continua en todo R menos donde se anula el denominador, que es en: ");
        solve(denominadorFuncion)
    
    % Apartado B
        printf("\n##############\n");
        printf("\nApartado B\n");
        printf("Se dibuja la tercera funcion con los ejes de coordenadas\n");
        figure 3;
        ezplot(f3, [-8, 12]);
        hold on;
        ejes();
    
    % Apartado C
        printf("\n##############\n");
        printf("\nApartado C\n");
        % Calculo de asintotas verticales
            printf("\nEl denominador se anula en x = ");
            solve(x.^2 - 16);
            asintotasVert(f3, x);
    
    % Apartado D
        printf("\n##############\n");
        printf("\nApartado D\n")
        % Representacion de las asintotas verticales
            asintotasH(f3, x); % No tiene ninguna as�ntota horizontal, asi que hay que comprobar si tiene oblicua
    
        % Asintota oblicua
            asintotaObli(f3, x);
    
    % Apartado E
        printf("\n##############\n");
        printf("\nApartado E\n");
        corteDeFunciones = solve(f3-x);
        printf("\nLa funcion se corta con su asintota en x = %f", sym2poly(corteDeFunciones));
        
        y = subs(f3, x, corteDeFunciones);
        printf("\nEn el punto (%f, %f)\n", sym2poly(corteDeFunciones), sym2poly(y)); % Imprime las coordenadas del punto de corte
      
    % Apartado F
        printf("\n##############\n");
        printf("\nApartado F\n");
        format long; % Pone el formato largo
        inicio = sym('0.4');
        metodoNR(f3, x, inicio, 2) % Realiza del metodo de Newton-Raphson partiendo desde 0.4 y dando 2 iteraciones

    % Apartado G
        printf("\n##############\n");
        printf("\nApartado F\n");
        printf("\nExisten puntos criticos en x = %f", puntosCriticos = double(solve(diff(f3, x), x)));
        printf("\n");
        printf("\nLa funcion tiene puntos cr�ticos, pero ninguno ser� ni m�ximo ni m�nimo ABSOLUTO \n");
        printf("ya que tienes as�ntotas verticales que tienden a + y - infinito que impiden estos \n");
        printf("tipos de puntos criticos, sin embargo, si pueden existir puntos cr�ticos RELATIVOS.\n");
        
    % Apartado H
        printf("\n##############\n"); 
        printf("\nExisten puntos de inflexion en x = %f", puntosInflexion = double(solve(diff(f3, x, 2), x)));
        printf("\n");
        hold off;
        
% ----------------------------------------------------

clear
syms x;

% ----------------------------------------------------

% Ejercicio 4
    printf("\n------------------------------------------------------------------------------------------------------\n");
    printf("\nEjercicio 4\n");
    printf("Apartado A\n");
    f4 = x*e^(1/x)
    figure 4;
    hold on;
    ezplot(f4);
    ejes(); % Ejes de coordenadas
    asintotasH(f4, x); % Asintota Horizontal
    asintotaObli(f4, x); % Asintota Oblicua
    plot([0, 0], [-1000, 1000], "r--"); % Asintota Vertical
    solucionesFunciones(f4, x);
    
    printf("\nExiste un punto de corte en x = 0 por la izquierda: ");
    corteEjesOXyOY = limit(f4, x, 0, 'left')
    printf("\nExisten puntos cr�ticos en %f\n",puntoCritico = double(solve(diff(f4))));
    
    segundaDerivadaF4 = diff(f4, x, 2);
    signoSegundaDerivada = subs(segundaDerivadaF4, x, puntoCritico);
    if(signoSegundaDerivada > 0)
        printf("El punto %f es un m�nimo\n", puntoCritico);
    elseif(signoSegundaDerivada < 0)
        printf("El punto %f es un m�ximo\n", puntoCritico);
    elseif(signoSegundaDerivada == 0)
        printf("El punto %f es un putno de inflexi�n\n", puntoCritico);
    endif
    
    % Apartado B
        printf("\n##############\n");
        printf("\nApartado B\n");
        
        printf("\nUtilizando el intervalo [0.5, 4], buscar extremos absolutos\n");
        printf("Miramos la imagen de los extremos del intervalo\n");
        imagenExtremoIzquierdo = subs(f4, x, sym('0.5'))
        imagenExtremoDerecho = subs(f4, x, sym('4'))
        if(imagenExtremoIzquierdo == imagenExtremoDerecho)
            printf("Ambos puntos son m�ximos absolutos de la funci�n\n");
        elseif(imagenExtremoIzquierdo < imagenExtremoDerecho)
            printf("El extremo derecho (x = 4) es el m�ximo absoluto de la funci�n\n");
        elseif(imagenExtremoIzquierdo > imagenExtremoDerecho)
            printf("El extremo izquierdo (x = 0.5) es el m�ximo absoluto de la funci�n\n");
        endif
        
        printf("\nComo sabemos del apartado anterior que hay un minimo en x = 1, \n");
        printf("ya no seguimos buscando m�s porque en este intervalo, este \n");
        printf("valor ser� un m�nimo absoluto del intervalo. \n");
    
% ----------------------------------------------------

clear
syms x;

% ----------------------------------------------------

% Ejercicio 5
    printf("\n------------------------------------------------------------------------------------------------------\n");
    printf("\nEjercicio 5\n");
    f5 = 4*x.^2 + 5*x - 2
    
    % Apartado A    
        printf("Apartado A\n");  
        printf("Para saber si existe al menos una solucion en el intervalo [-3, 0], usaremos el Th. de Bolzano\n");
        imagenExtremoIzquierdo = subs(f5, x, -3)
        imagenExtremoDerecho = subs(f5, x, 0)
        
        if(imagenExtremoIzquierdo*imagenExtremoDerecho <= 0)
            printf("\nExiste al menos una soluci�n en el intervalo [-3, 0]\n");
         else
            printf("\nNo se puede asegurar que no haya ninguna soluci�n en el intervalo [-3, 0]\n");
        endif
        
        printf("\nSabiendo que la funcion es una funci�n cuadr�tica completa, podemos deducir que esta solucion\n");
        printf("�nica, ya que para que estuvieran las dos soluciones en el intervalo, ambas im�genes\n");
        printf("deber�an de tener el mismo signo\n");
        
    % Apartado B
        % Ponemos los valores de la funcion en simb�lico para que no salga warnings
        extremoIzq = sym('-2');
        extremoDe = sym('0');
        errorMinimo = sym('0.04');
        dicotomia(f5, x, extremoIzq, extremoDe, errorMinimo)

% ----------------------------------------------------

clear
syms x;

% ----------------------------------------------------

% Ejercicio 6
    printf("\n------------------------------------------------------------------------------------------------------\n");
    printf("\nEjercicio 6\n");
    printf("Comprobar que la recta tangente a la gr�fica de una funcion f en el\n");
    printf("punto x0 = 0 coincide con el polinomio de Mc-Laurin de grado menor o\n");
    printf("igual a 1 (orden 1)\n");
 
    f6 = input("\nEscribe una funcion: ");
    pendienteEn0 = subs(diff(f6), x, 0);
    
    % Se calculan las funciones de la recta tangente, y los polinomio de Mc-Laurin de orden 0 y 1
    printf("\nObtenemos las funciones necesarias\n");
    polRectaTangente = subs(f6, x, 0) + pendienteEn0*(x - 0)
    polMcLaurinGrado0 = taylor(f6, x, 0, 'order', 1)
    polMcLaurinGrado1 = taylor(f6, x, 0, 'order', 2)
    
    % Calculamos sus repectivas im�genes
    printf("\nVemos la imagen en x = 0 de cada una de las funciones anteriores\n");
    imagenPolRectaTangente = subs(polRectaTangente, x, 0)
    imagenPolMcLaurinGrado0 = subs(polMcLaurinGrado0, x, 0)
    imagenPolMcLaurinGrado1 = subs(polMcLaurinGrado1, x, 0)
    
    printf("\n##############\n");
    
    % Volvemos a repetir el proceso pero centr�ndolo todo en otro punto, en este caso en x = 2
    printf("\nAhora realizaremos lo mismo pero centrando todo en x = 2\n");
    polRectaTangente = subs(f6, x, 2) + pendienteEn0*(x - 2)
    polMcLaurinGrado0 = taylor(f6, x, 2, 'order', 1)
    polMcLaurinGrado1 = taylor(f6, x, 2, 'order', 2)
    
    printf("\nY los resultados de sus respectivas im�genes centradas en 2\n");
    imagenPolRectaTangente = subs(polRectaTangente, x, 2)
    imagenPolMcLaurinGrado0 = subs(polMcLaurinGrado0, x, 2)
    imagenPolMcLaurinGrado1 = subs(polMcLaurinGrado1, x, 2)
    
    % Explicaci�n del motivo de los resultados
    printf("\nObservando los resultados, podemos decir que si centramos las 3 funciones\n");
    printf("en el mismo punto, dar�n 3 resultados inguales, esto es debido a que la funci�n de \n");
    printf("la recta tangente es igual al polinomio de Mc-Laurin de orden 1, y el de orden 0 \n");
    printf("representa en que puntos est�n centrados ambas funciones, por lo que siempre coinciden\n");

% ----------------------------------------------------

clear
syms x;

% ----------------------------------------------------

% Ejercicio 7
    printf("\n------------------------------------------------------------------------------------------------------\n");
    printf("\nEjercicio 7\n");
    
    f7 = sin(x).^2
    
    % Calculamos los polinomios de Mc-Laurin de orden 4 y 5 y veremos que resulta ser iguales
    polMcLaurinOrden4 = taylor(f7, x, 0, 'order', 5)
    polMcLaurinOrden5 = taylor(f7, x, 0, 'order', 6)
    
    printf("\nComo podemos ver, ambos polinomios de Mc-Laurin son id�nticos para averiguar por qu�, \n");                
    printf("calcularemos el sumando correspondiente al de orden 5 para ver que pasa\n");                
    
    % Volvemos a calcular el polinomio de orden 5 pero a mano
    polTaylorOrden5 = (diff(f7, x, 5))/(factorial(5))*x.^5*x.^5
    
    % Explicaci�n del resultado anterior y previsi�n de su resultado cuando se centre en el 0
    printf("Viendo el polinomio resultante podremos ver que en el numerador solo hay productos\n");
    printf("y que para crear este quinto sumando del polinomio de Mc-Laurin, hay que centrarlo en x = 0,\n");
    printf("y para centrarlo, hay que ver la imagen en x = 0 de la quinta derivadad de f7.\n");
    printf("El resultado de esta imagen es: \n");
    sumando5McLaurin = subs(polTaylorOrden5, x, 0)
    
    printf("\nViendo que se anula, podemos saber que en el polinomio de Mc-Laurin completo, este sumando\n");
    printf("ya no se pone porque queda igual a 0, en este caso con esta funci�n, existe dos polinomios\n");
    printf("de Mc-Laurin id�nticos de distinto grado.\n");
     
% ----------------------------------------------------

clear
syms x;

% ----------------------------------------------------

% Ejercicio 8
    printf("\n------------------------------------------------------------------------------------------------------\n");
    printf("\nEjercicio 8\n");
    potencia = sym('0.27');
    f8 = x^potencia
    
    % Calculamos los polinomios de Taylor de orden 1 y 2
    centro = sym('3');
    orden1 = sym('2');
    orden2 = sym('3');
    polTaylorOrden1 = taylor(f8, x, centro, 'order', orden1); 
    polTaylorOrden2 = taylor(f8, x, centro, 'order', orden2); 
    
    % Primeras 2 aproximaciones con los polinomios de orden 1 y 2
    printf("Centrando x a %f da como resultado en los primeros polinomios de orden 1 y 2\n", double(centro));
    aproximacion1 = double(subs(polTaylorOrden1, x, e))
    aproximacion2 = double(subs(polTaylorOrden2, x, e))
    
    % Se calcula el polinomio de Taylor de orden 3 para mejorar la aproximaci�n
    printf("\nPara mejorar la aproximaci�n podemos hacer el polinomio de Taylor de ");
    orden3 = sym('4')
    polTaylorOrden3 = taylor(f8, x, centro, 'order', orden3)
    aproximacion3 = double(subs(polTaylorOrden3, x, e));
    printf("\nUtilizando el polinomio de Taylor anterior, da como resultado %f\n", aproximacion3);

% ----------------------------------------------------

clear
syms x;

% ----------------------------------------------------

% Ejercicio 9
    printf("\n------------------------------------------------------------------------------------------------------\n");
    printf("\nEjercicio 9\n");
 
    % Se muestra que funci�n aproximaremos con el polinomio de Mc-Laurin
    syms m m0 v c;
    printf("Partiendo de la f�rmula de la masa de la Teor�a de la Relatividad,");
    m = (m0)/(sqrt(1-(v.^2)/(c.^2)))
    
    % Aplicamos el polinomio de Mc-Laurin de orden 2 sobre la funci�n anterior
    printf("\nSe puede aproximar la soluci�n utilizando el polinomio de Mc-Laurin de orden 2");
    aproximacionDeMcLaurin = taylor(m, v, 0, 'order', 3)

% ----------------------------------------------------

clear
syms x;

% ----------------------------------------------------

% Ejercicio 10
    printf("\n------------------------------------------------------------------------------------------------------\n");
    printf("\nEjercicio 10\n"); 
    
    f10 = sin(x)
    
    % Apartado A
        % Calculamos todos los polinomios necesarios para el ejercicio (los de orden 1, 3, 5 y 7)
        centro = sym('0');
        orden1 = sym('2');
        orden3 = sym('4');
        orden5 = sym('6');
        orden7 = sym('8');
        polTaylorOrden1 = taylor(f10, x, centro, 'order', orden1)
        polTaylorOrden3 = taylor(f10, x, centro, 'order', orden3)
        polTaylorOrden5 = taylor(f10, x, centro, 'order', orden5)
        polTaylorOrden7 = taylor(f10, x, centro, 'order', orden7)
    
    % Apartado B
        % Dibujamos las funciones anteriores
        intervalo = [-5, 5];
        figure 10;
        hold on;
        ezplot(f10, intervalo)
        ezplot(polTaylorOrden1, intervalo)
        ezplot(polTaylorOrden3, intervalo)
        ezplot(polTaylorOrden5, intervalo)
        ezplot(polTaylorOrden7, intervalo)
        ejes();
        legend('Funcion f10', 'Polinimio T1', 'Polinimio T3', 'Polinimio T5', 'Polinimio T7')
    
    % Apartado C
        % Calculamos las aproximaciones de la solucion con cada una de las funciones para comparar
        aproximarA = sym('1/2');
        aproximacion1 = double(subs(polTaylorOrden1, x, aproximarA))
        aproximacion3 = double(subs(polTaylorOrden3, x, aproximarA))
        aproximacion5 = double(subs(polTaylorOrden5, x, aproximarA))
        aproximacion7 = double(subs(polTaylorOrden7, x, aproximarA))
        resultadoReal = double(sin(aproximarA))
        clear;