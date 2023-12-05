# Computación

Cosillas para algún curso de Computación

## Exámenes

### Examen 01

El código requerido se puede encontrar en dos versiones:

- [julia](./examen-01.jl) que es más moderno y utiliza operaciones con arreglos.
- [Fortran](./examen-01.f90) que pues es Fortran...

### Examen 02

- [Teoría](./examen-02-teoria.md)
- [Código en Fortran](./examen-02.f90) para la implementación de la solución.
- [Código en Julia](./examen-02.jl) para la comprobación.
- [Código en Python](./examen-02-plot.py) para la gráfica.
- [Resultados de Fortran](./resultados.dat) las columnas son x, solución numérica, solución analítica.
- [Resultados de Julia](./resultados-julia.csv) esta columna es solo los resultados de la solución numérica.

#### Resultados

| x | Sol. Num. Fortran | Sol. Analítica | Sol. Num. Julia |
| :---: | :---: | :---: | :---: |
| 0.157079503  |   0.899999976    | 0.987688363    |0.9879165851930638     |
| 0.314159006  |   0.800000012    | 0.951056600    |0.9514573056933008     |
| 0.471238494  |   0.699999988    | 0.891006708    |0.8915217581642396     |
| 0.628318012  |   0.599999964    | 0.809017301    |0.8095887929650668     |
| 0.785397530  |   0.499999911    | 0.707107246    |0.7076800249805922     |
| 0.942476988  |   0.399999887    | 0.587785900    |0.5883099522733389     |
|  1.09955657  |   0.299999923    | 0.453991264    |0.45442391333068144    |
|  1.25663602  |   0.199999943    | 0.309017986    |0.3093254137506021     |
|  1.41371548  |    9.99999419E-02| 0.156435668    |0.15659461550821835    |
|  1.57079506  |   -4.74127830E-08|  1.26759085E-06|-1.8240964294591322e-13|
|  1.72787452  |  -0.100000031    |-0.156433046    |-0.15659461550857867   |
|  1.88495398  |  -0.200000018    |-0.309015453    |-0.309325413750949     |
|  2.04203343  |  -0.300000012    |-0.453988910    |-0.45442391333100646   |
|  2.19911313  |  -0.400000036    |-0.587783873    |-0.588309952273634     |
|  2.35619259  |  -0.500000000    |-0.707105458    |-0.7076800249808503    |
|  2.51327205  |  -0.599999964    |-0.809015751    |-0.8095887929652813    |
|  2.67035151  |  -0.699999988    |-0.891005516    |-0.8915217581644053    |
|  2.82743096  |  -0.800000012    |-0.951055765    |-0.9514573056934135    |
|  2.98451066  |  -0.899999976    |-0.987687945    |-0.9879165851931208    |

![Gráfica](./examen-02-plot.png)
