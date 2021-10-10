# Octave

## Algunos datos importantes

- Octave **distingue** mayúsculas de minúsculas, por lo que el nombre de todas las funciones estarán por defecto en minúsculas.  
- Se pueden hacer comentarios, estos se crean con el carácter **%**.  
- El comando ```clc```, limpia la pantalla. Y el comando ```clear```, borra todas las variables que hay creadas.  
- Los comando ```help <nombreComando>``` y ```doc <nombreComando``` muestran ayuda de los demás comandos, el primero te lo muestra en la línea de comandos y *doc* te lleva a la documentación.  
- La palabra ```inf``` tiene el valor de infinito, se puede operar con ella y ver que valores da como resultado.  
- ```NaN``` significa Not a Number, si una operación no da como resultado un número, tendrá esta salida.  
- **i**, para operar con números imaginarios, también se puede utilizar **j** pero este último mejor olvidarlo.  

## Operadores aritmeticos

Octave al ser un lenguaje de programación para hacer cálculos matemáticos tiene todos los distintos operadores que se puedan necesitar

- **+**, **-**, **/**, **\***: Para las sumas, restas, divisiones y multiplicaciones.  
- **^**: El acento circunflejo para hace potencias.  

## Formatos de los numeros

En Octave se puede cambiar la precisión y el número de dígitos que queremos para los resultados con el comando ```format <tipoFormato>```.  

- ```format short```: Es el formato por defecto que muestra 4 dígitos en la parte decimal.  
- ```format rat```: Muestra el resultado en una fracción que dos números enteros.  
- ```format long```: Punto fijo con 15 dígitos en la parte decimal.  
- ```format long e```: Formato de coma flotante con 15 dígitos en la parte decimal.  

Se puede comprobar como funciona este cambio de formato con números irracionales como *e*, además, para elevar el número *e* a una potencia existen dos formas. Utilizando el operador **^** o la función ```exp(<exponente>)```.  

-----

## Variables numericas

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

### Funcion plot

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

