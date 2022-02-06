'''
Generar la gráfica de
* sin(t)
'''

import numpy as np
import matplotlib.pyplot as plt


# Generar un arreglo desde 0 hasta 10, en pasos de 0.1
time = np.arange(0, 10, 0.1);

# O bien, generar un arreglo desde 0 hasta 10, con 10 elementos.
# time = np.linspace(0.,10.,10)

# Tomar el seno del arreglo anterior
fun01   = np.sin(time)

# Generar el objeto "plot", que utiliza el método plot()
# Esta línea, por sí misma, no da un resultado.
plt.plot(time, fun01)

# Mostrar la gráfica (se abrirá una ventana)
# plot.show()

# Agregar un título al objeto plot, con el método title()
plt.title('Función sinusoidal')

# Etiquetas de los ejes
plt.xlabel('Tiempo (s)')
plt.ylabel('Amplitud')

# Activar la grilla
# plt.grid(True)

# Mostrar líneas horizontal y vertical
plt.axhline(y=0, color='k',ls=':')
plt.axvline(x=0, color='k',ls=':')


# Mostrar la gráfica
plt.show()
