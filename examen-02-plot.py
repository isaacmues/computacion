import numpy as np
import matplotlib.pyplot as plt

# Carga los datos
input_data = np.loadtxt('resultados.dat', usecols=(0,1,2))
x = input_data[:,0]
y = input_data[:,1] # Solución numérica 
u = input_data[:,2] # Solución analítica

# Hace la gráfica
fig, ax = plt.subplots()
ax.plot(x, u, label='Solución Analítica')
ax.plot(x, y, label='Solución Numérica')
ax.legend()
ax.set_title('Diferencias Finitas')
ax.set_xlabel=('x')
ax.set_ylabel=('y')
plt.savefig('examen-02-plot.png')
