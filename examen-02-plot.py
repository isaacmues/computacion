import numpy as np
import matplotlib.pyplot as plt

# Carga los datos
input_data_py = np.loadtxt('resultados.dat', usecols=(0,1,2))
x = input_data_py[:,0]
y = input_data_py[:,1] # Solución numérica 
u = input_data_py[:,2] # Solución analítica
y2 = np.loadtxt('resultados-julia.csv')

# Hace la gráfica
fig, ax = plt.subplots()
ax.plot(x, u, label='Solución Analítica')
ax.plot(x, y, label='Solución Numérica (Fortran)')
ax.plot(x, y2, label='Solución Numérica (Julia)')
ax.legend()
ax.set_title('Diferencias Finitas')
ax.set_xlabel=('x')
ax.set_ylabel=('y')
plt.savefig('examen-02-plot.png')
