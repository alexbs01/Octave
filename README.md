# Octave

## Índice

- [Algunos datos importantes](#Algunos-datos-importantes)
- [Operadores](#Operadores)
- [Formatos de los números](#Formatos-de-los-números)
- [Variables numéricas](#Variables-numéricas)
- [Funciones predefinidas](#Funciones-predefinidas)
- [Representaciones gráficas](#Representaciones-gráficas)
  - [Vectores](#Vectores)
  - [Funciones importantes para vectores](#Funciones-importantes-para-vectores)
  - [Operaciones de matrices de elemento a elemento](#Operaciones-de-matrices-de-elemento-a-elemento)
  - [Función plot](#Función-plot)
    - [Funciones para plot](#Funciones-para-plot)
  - [Ejemplos de los operadores lógicos y relacionales](#Ejemplos-de-los-operadores-ógicos-y-relacionales)
- [Archivos .m](#Archivos-.m)
- [Cálculo simbólico](#Cálculo-simbólico)
  - [Variables simbólicas](#Variables-simbólicas)
  - [Constantes simbólicas](#Constantes-simbólicas)
  - [Evaluación de variables](#Evaluación-de-variables)

## Algunos datos importantes

- Octave **distingue** mayúsculas de minúsculas, por lo que el nombre de todas las funciones estarán por defecto en minúsculas.  
- Se pueden hacer comentarios, estos se crean con el carácter **%**.  
- El comando ```clc```, limpia la pantalla. Y el comando ```clear```, borra todas las variables que hay creadas.  
- Los comando ```help <nombreComando>``` y ```doc <nombreComando``` muestran ayuda de los demás comandos, el primero te lo muestra en la línea de comandos y *doc* te lleva a la documentación.  
- La palabra ```inf``` tiene el valor de infinito, se puede operar con ella y ver que valores da como resultado.  
- ```NaN``` significa Not a Number, si una operación no da como resultado un número, tendrá esta salida.  
- **i**, para operar con números imaginarios, también se puede utilizar **j** pero este último mejor olvidarlo.  

## Operadores

Octave al ser un lenguaje de programación para hacer cálculos matemáticos tiene todos los distintos operadores que se puedan necesitar, ya sean aritméticos, relacionales o lógicos.  

| Operador aritmético | Significado    | Operador relacional |    Significado    | Operador lógico | Significado |
| :------------------ | :------------- | :-----------------: | :---------------: | --------------: | ----------: |
| +                   | Suma           |          <          |     Menor que     |               & |     AND (y) |
| -                   | Resta          |         <=          | Menor o igual que |              \| |      OR (o) |
| /                   | División       |          >          |     Mayor que     |               ~ |    NOT (no) |
| \*                  | Multiplicación |         >=          | Mayor o igual que |                 |             |
| ^                   | Potencia       |         ==          |    Idéntico a     |                 |             |
|                     |                |      ~=     !=      |    Distinto de    |                 |             |



## Formatos de los números

En Octave se puede cambiar la precisión y el número de dígitos que queremos para los resultados con el comando ```format <tipoFormato>```.  

- ```format short```: Es el formato por defecto que muestra 4 dígitos en la parte decimal.  
- ```format rat```: Muestra el resultado en una fracción que dos números enteros.  
- ```format long```: Punto fijo con 15 dígitos en la parte decimal.  
- ```format long e```: Formato de coma flotante con 15 dígitos en la parte decimal.  

Se puede comprobar como funciona este cambio de formato con números irracionales como *e*, además, para elevar el número *e* a una potencia existen dos formas. Utilizando el operador **^** o la función ```exp(<exponente>)```.  

-----

## Variables numéricas

Como en muchos lenguajes de programación se pueden guardar valores dentro de variables, y posteriormente, operar con ellas.

```octave
base = 5 % Base del cuadrilatero
altura = 8 % Altura del cuadrilatero

>> base * altura % Esta operacion dara el resultado de los dos valores
```

-----

## Funciones predefinidas

Son funciones ya propias de Octave. E aquí ejemplos de ellos:  

- ```abs```: Calcula el valor absoluto de lo que se ponga como valor de entrada de la función.
- ```rats```: Aproxima el valor que se ponga a una fracción.  
- ```sqrt```: Significa *square root*, y hace la raíz cuadrada.  
- ```exp```: Calcula el resultado de elevar el número *e*, al exponente que se le asigne en la función.  
- ```log```: Calcula el logaritmo neperiano del número que se le ponga. También existe ```log2``` y ```log10```.  
- ```sin```, ```cos```, ```tan```, ```sec```, ```csc```, ```cot```: Para las razones trigonométricas en **radianes**.  
- ```asin```, ```acos```, ```atan```, ```asec```, ```acsc```, ```acot```: Para las razones trigonométricas inversas.  
- ```factor```: Factoriza el número que se le escriba.  
- ```factorial```: Realiza el factorial del número, ya que la forma de hacer el factorial con ```n!```.  
- ```fix```: Redondea el número sin que importen los decimales, por lo que deja como un numero entero (Por ej: fix(4.9) = 4).  
- ```floor```: Redondea siempre para abajo por lo que haciéndolo sobre un número positivo lo dejará solo con la parte entera, mientras que con los número negativos siempre se le restará 1.  
- ```round```: Hace el redondeo típico, si la parte decimal está por encima de las 5 décimas redondea hacia arriba, y si no llega redondea hacia abajo.  

-----

## Representaciones gráficas

### Vectores

Los vectores se crean almacenando un conjunto de números en una variable de la siguiente forma, v = [1 2 3; 4 5 6; 7 8 9], esto resultaría en un vector de 3*3. 

Para especificar las columnas los números se van separando por comas o por espacios como en el ejemplo del párrafo anterior, y las filas se separan por **;**.

Se puede obtener el determinante de una matriz escribiendo tras el nombre un apostrofe **'**, de esta forma v'.  

### Funciones importantes para vectores

- ```sum```: Suma las columnas del vector.  
- ```max```: Escribe otro vector donde en cada columna solo está el máximo valor de esa columna. En el caso del vector *v*  imprimiría por pantalla  ```7 8 9```.  
- ```min```: Realiza lo mismo que la función anterior solo que con los valores mínimos de cada columna.  
- ```sort```: Ordena la matriz en orden creciente.  
- ```length```: Devuelve el tamaño de la matriz.  
- ```zeros(filas, columnas)```: Con esta función de dos parámetros, se crea una matriz que del tamaño que se le asigne en la que cada valor es igual a 0.  
- ```linspace(inicio, final, divisiones)```: Divide el intervalo enmarcado por el inicio y el final, en el número de divisiones del que le marquemos en su último parámetro.  
- ```inicio:salto:final```: El operador de **:** sirve para crear un intervalo que va desde inicio hasta final dando saltos según se le indique.  

### Operaciones de matrices de elemento a elemento

Para realizar operaciones elemento por elemento con las matrices se hace de la forma .<operador>. Ejemplos:

```octave
v = [2 4 6 8];
v.+5 = 7 9 11 13
v.^2 = 4 16 36 64
```

Y esto sirve con todos los operadores, como ```.+```, ```.-```, ```.\*```, ```./``` y ```.^```.   

### Función plot

Permite dibujar puntos en el plano usando vectores o funciones. Por ejemplo:  

```octave
>> y = [0 3 3 0 0]
y =
   0   3   3   0   0

>> x = [0 0 2 2 0]
x =
   0   0   2   2   0

>> plot(x, y) % Dibujará un cuadrilátero
```

#### Funciones para plot

Hay algunas funciones que permiten dar más claridad a las gráficas.  

- ```title```: Permite dar un título a la gráfica.  
- ```xlabel```: Etiqueta el eje OX.  
- ```ylabel```: Etiqueta el eje OY.  
- ```text(a, b, 'texto')```: Permite poner un texto en el punto (a, b) que le especifiquemos.  
- ```legend('texto 1', ..., 'texto n')```: Permite poner una leyenda para las gráficas que se dibujen.  

Si creamos una función y queremos seguir editándola podemos hacerlo con el comando ```hold on``` y con ```hold off``` para dejar de editarla. Y si queremos crear otra gráfica se puede con ```figure(n)``` donde *n* es el número de la función.  

Con ```axis equal``` podemos forzar a que los ejes midan lo mismo para no distorsionar la imagen.  

### Ejemplos de los operadores lógicos y relacionales

```octave
>> v = -1:1:5 % Se crea una matriz de una fila
v =
  -1   0   1   2   3   4   5

>> v >= 2 % Comprueba cuales de los elementos cumplen la condición de que sea >= 2
ans =
  0  0  0  1  1  1  1
  
>> (v >= 2)&(v < 4) % Hace la misma comprobación de ante, pero añade que los números deben ser < 4
ans =
  0  0  0  1  1  0  0
```

-----

## Archivos .m

Con Octave se pueden hacer recopilaciones de código para poder usarlo múltiples veces, esto se hace con el editor y nos permite escribir instrucciones muy largas y poder corregirlo más fácilmente. Todas estas instrucciones se guardan en archivos .m.  

Para ver ejemplos de archivos .m de recopilaciones de código y de funciones, mirar en la carpeta [**src**](./src) de este repositorio.  

-----

## Cálculo simbólico

El cálculo simbólico nos permite dibujar funciones de una forma distinta, y hacer derivadas, integrales y otros tipos de operaciones con funciones. El cálculo simbólico no viene instalado por defecto en Octave, por lo que hay que instalarlo a través de la librería de *symbolic*.  

### Variables simbólicas

Para trabajar con el modo simbólico debemos declarar variables simbólicas con la instrucción ```syms <nombreVariable>```.  

```octave
% Para definir variables simbolicas de una funcion se hace:
syms a b c; % Las variables 'a', 'b' y 'c', tienen ahora un caracter simbolico
funcion = a^2 + b + c;
```

-----

### Constantes simbólicas

También se pueden asignar constantes simbólicas para usarlas durante los programas.  

```octave
constanteSimbolica = sym('4/5'); % Y ahora la variables "constanteSimbolica" tiene un valor constante simbolico de 4/5
```

-----

### Evaluación de variables

Con las variables simbólicas se puede utilizar la función subs para evaluar punto X. La sintaxis de la función es ```subs(funcion, variable, valor);``` o ```subs(funcion, {variable1, ..., variableN}, {valor1,..., valorN});``` según queramos obtener una imagen o que en los valores se le asignen se sustituyan por los valores dados.  

```octave
f = x + 1;
subs(f, x, 2)
% Dara como resultado 3
```

-----

### Limites de funciones

Con la librería symbolic tenemos acceso a otras funciones como lo es ```limit``` esta función permite calcular límites de funciones, pudiendo escoger si la queremos evaluar a la izquierda o a la derecha.  

```octave
f = x + 1;
limit(f, x, 2, 'left')
limit(f, x, 2, 'right') % Si no especificamos por que lado, se evaluará por la derecha

% En este caso como la funcion es continua dara el mismo resultado, pero con otra funcion
% perfectamente puede dar que es infinito, o incluso hacer que x tienda al infinito
```

-----

### Derivadas de funciones

Otra función de symbolic es ```diff```, la cual nos permite calcular derivadas de las funciones que le pongamos como argumento.

```octave
f = x.^2 + 3*x - 1;
diff(f, x) % ans = 2*x + 3
diff(f, x, 2) % ans = 2

% La función diff tiene tres posibles parámetros, el primero para la funcion, el segundo para la 
% variable, y un tercero opcional para especificar que número de derivada queremos. Si no
% especificamos hará la primera.  
```

