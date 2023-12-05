# Examen 2

## Enunciado

Resuelve numéricamente la siguiente ecuacion diferencial de segundo orden utilizando
el método de diferencias finitas:

```math
y'' + y = 0
```

en el intervalo $`\{0,\pi\}`$, con las condiciones de frontera 

```math
\begin{align}
y(0)&=1 & y(\pi)&=-0.3,
\end{align}
```

toma $`h=\pi/20`$.

- Para obtener la solución con el método propuesto hay que resolver un sistema
de ecuaciones lineales $`Ax=b`$ de $`19\times19`$. Indica cómo obtienes $`A`$ y
$`b`$.
- Describe los métodos usados para resolver el sistema de ecuaciones
- Por otra parte, obtén la solucióna anlítica de la ecuación diferencial.
- Grafica las soluciones numérica y analítica. ¿Cómo se comparan entre ellas?

**Nota.** La condición de frontera no coincide, tomaré $`y(\pi) = -1`$.

## Diferencias Finitas

Convirtiendo el problema a diferencias finitas tenemos que

```math
\frac{y_{i+1} - 2 y_i + y_{i-1}}{h^2}+ y_i = 0
\Rightarrow
y_{i+1} + (h^2 - 2) y_i + y_{i-1} = 0
```

En las fronteras tenemos que

```math
y_2 + (h^2 - 2) y_1 = -y_0 = -1
```

y

```math
(h^2 - 2) y_{19} + y_{18} = -y_{20} = 1.
```

En forma matricial podemos reescribir el sistema como

```math
\begin{bmatrix}
(h^2 - 2) & 1 & 0 & \dots & 0 \\
1 & (h^2 - 2) & 1 & \dots & 0 \\
0 & 1 & (h^2 - 2) & \dots & 0 \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
0 & \dots & 0 & 1 & (h^2 - 2)
\end{bmatrix}
\begin{bmatrix}
y_1 \\
y_2 \\
y_3 \\
\vdots \\
y_{19}
\end{bmatrix}
=
\begin{bmatrix}
-1 \\
0 \\
0 \\
\vdots \\
1
\end{bmatrix}
```

## Método de eliminación gaussiana

Para resolver el sistema planteado usaremos el método de eliminación gaussiana.
Este método contempla tres operaciones aplicables a los renglones de la matriz.

1. Intercambiar renglones.
2. Multiplicación por un escalar diferente de cero.
3. Sumar el múltiplo de un renglón a otro.

Usando estas operaciones el objetivo es obtener una matriz triangular de la cual
será fácil obtener la solución del sistema.

El algoritmo implementado en esta ocasión es la eliminación gaussiana parcialmente pivotante.
Se llama así porque hace uso del intercambio de renglones para minimizar el número
de operaciones (introduciendo menos errores) y evitar la división entre cero
que puede ocurrir al tener renglones "desordenados".

El pivotaje consiste en buscar el renglón con el mayor coeficiente a la izquierda
debajo del renglón actual e intercambiarlos. Luego se sigue el proceso usual de eliminación,
escalar y restar usando el primer coeficiente diferente de cero. Este proceso
se puede extender a buscar el coeficiente mayor tanto en renglones como en columnas
siendo así un pivotaje completo en lugar de parcial pero es más difícil de programar.

## Solución Analítica

La solución general de la ecuación es

```math
y(x) = c_1 cos(x) + c_2\sin(x) 
```

Cuando aplicamos las condiciones de frontera obtenemos

```math
y(0) &= c_1 = 1
```
