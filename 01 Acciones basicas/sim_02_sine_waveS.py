'''
Generar las gráficas de
* sin(t)
* sin(3t)
* 2 sin(3t + pi/2) + 1

En un periodo de la señal de menor frecuencia, en una misma gráfica.
'''

import numpy as np
import matplotlib.pyplot as plt
import math

N = 100         # Cantidad de muestras
T = 2*math.pi   # Periodo de la señal de menor frecuencia
Tfin = 1*T      # Tiempo final de simulación
Tini = 0

# Arreglo de tiempo:
t = np.linspace(Tini,Tfin,N)

fun01   = np.sin(t)
fun02   = np.sin(3*t)
fun03   = 2*np.sin(3*t + math.pi/2) + 1

# Gráficas
plt.plot(t, fun01,'b-',linewidth=1)
plt.plot(t, fun02,'g--',linewidth=1)
plt.plot(t, fun03,'ko',linewidth=1, markersize=2)

# O bien:
# plt.plot(t, fun01,'b-', \
#          t, fun02,'g--',\
#          t, fun03,'k^'  )
# En esta sintaxis, no estoy seguro de cómo se pasan los parámetros
# de linewidth y markersize

# Mostrar líneas horizontal y vertical
plt.axhline(y=0, color='k',ls=':',linewidth=0.5)
plt.axvline(x=0, color='k',ls=':',linewidth=0.5)


# Cambio de algunas propiedades de la gráfica:
plt.rc('font', size=10)                 # Tamaño de fuente
plt.title('Funciones sinusoidales')
plt.xlabel('Tiempo (s)')
plt.ylabel('Amplitud')



cant_de_ticks = math.ceil(Tfin/math.pi)+1
lista_de_ticks = np.linspace(0,Tfin,cant_de_ticks)
lista_de_etiquetas = ['0']

for i in range(1,cant_de_ticks):
    lista_de_etiquetas.append(fr'${i} \pi$')        # f permite meter variables dentro del string
                                                    # r indica que es una fórmula


plt.xticks(lista_de_ticks,lista_de_etiquetas)


# Guardar imagen en varios formatos
plt.savefig('imagenes/grafica.png')
plt.savefig('imagenes/grafica_transparente.png',transparent=True)
plt.savefig('imagenes/grafica_vector.svg')
plt.savefig('imagenes/grafica_vector_transparente.svg',transparent=True)

# Mostrar la gráfica (se abrirá una ventana)
plt.show()
