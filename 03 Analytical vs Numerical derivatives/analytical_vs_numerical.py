'''
Plot the analytical derivative of a function, and compare it to its numerical derivative
f(t) = exp(-2t) * sin(10t - 6)

f'(t) = df /dt = -2 * exp(-2t) * sin(10t - 6) + 10 * exp(-2t) * cos(10t - 6)

g(t) = [ f(t+dt) - f(t)] / dt
'''

import os
import numpy as np
import sympy as sy
import matplotlib.pyplot as plt
from matplotlib.pyplot import figure

figure(figsize=(10, 6), dpi=80)

# Define the analytical functions:
f_eq = lambda t: np.exp(-2*t) * np.sin(10*t - 6)
df_tru_eq = lambda t: -2 * np.exp(-2*t) * np.sin(10*t - 6) + 10 * np.exp(-2*t) * np.cos(10*t - 6)

# Define the tru_time array, to plot the true derivative
t_fin = 3
tru_time = np.arange(0, t_fin, 0.01)

# Evaluate the true derivative
df_tru_data = df_tru_eq(tru_time)

# Generate array from 0 to 4, with step of dt
dt = 0.1
dsc_time = np.arange(0, t_fin, dt)

# Calculate the approximate derivative
f_data = f_eq(dsc_time)
df_apx_data = np.diff(f_data) / dt     # np.diff(a) calculates the difference between one element and the next, within array a    

# Calculate the symbolic derivative and evaluate it over time_apx
t = sy.symbols('t', real = True)
f_sym = sy.exp(-2*t) * sy.sin(10*t-6)               # Defines the symbolic equation
df_sym = sy.lambdify(t,sy.diff(f_sym,t),"numpy")    # Finds the symbolic derivative and converts it to a lambda function
df_sym_data = df_sym(dsc_time)

plt.plot(tru_time,df_tru_data)
plt.scatter(dsc_time[:-1],df_apx_data, facecolors='none', edgecolors='r') # df_apx has n-1 elements, so we must also reduce dsc_time's length
plt.plot(dsc_time, df_sym_data, 'yo', markersize=5)
plt.xlabel('t')
plt.ylabel('df/dt')
plt.legend(['Analytical derivative, over continuous time',\
            'Numerical derivative, over discrete time',\
            'Symbolic derivative, over discrete time'])

save_path = os.path.dirname(os.path.abspath(__file__)) + '/img/'

if not os.path.isdir(save_path):
    os.mkdir(save_path)

figure_name = 'fig_derivatives_comparison.png'
plt.savefig(save_path + figure_name)
plt.show()
