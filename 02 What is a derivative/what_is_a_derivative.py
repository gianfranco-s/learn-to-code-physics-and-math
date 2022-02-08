'''
Plot the velocity of a car whose position is
x(t) = t^3
'''

import os
import numpy as np
import matplotlib.pyplot as plt

# Initialise the subplot function using number of rows and columns
figure, axis = plt.subplots(1, 3)

# Generate array from 0 to 4, with step of 0.1
time = np.arange(0, 4, 0.1)

# Evaluate the position as a function of time
position_eq = lambda t: t**3
position = position_eq(time)

# Create tangential lines, evaluated in ta and tb = ta + dt
ta = 2.0

# -------------------------- Velocity with dt = 1.0 -------------------------
dt = 1.0
tb = ta + dt

xa = position_eq(ta)
xb = position_eq(tb)

v = (xb - xa) / (tb - ta)
velocity_eq = lambda t: v*(t-ta) + xa
velocity = velocity_eq(time)

# Generate "plt" object using plot() method, and add title.
axis[0].plot(time, position,'b-',linewidth=1)
axis[0].plot(time, velocity,'r--',linewidth=1)
axis[0].plot(ta, xa,'rs',fillstyle='none',markersize=12)
axis[0].plot(tb, xb,'ro',fillstyle='none',markersize=10)

# Set limits for axis. If not using "plt.xlim(...)" notation, use axis[].set_...
axis[0].set_xlim(0,max(time))
axis[0].set_ylim(0,max(position))
axis[0].set_title(f'dt = {tb} - {ta}')

# -------------------------- Velocity with dt = 0.5 -------------------------
dt = 0.5
tb = ta + dt

xa = position_eq(ta)
xb = position_eq(tb)

v = (xb - xa) / (tb - ta)
velocity_eq = lambda t: v*(t-ta) + xa
velocity = velocity_eq(time)

# Generate "plt" object using plot() method, and add title.
axis[1].plot(time, position,'b-',linewidth=1)
axis[1].plot(time, velocity,'r--',linewidth=1)
axis[1].plot(ta, xa,'rs',fillstyle='none',markersize=12)
axis[1].plot(tb, xb,'ro',fillstyle='none',markersize=10)

# Set limits for axis. If not using "plt.xlim(...)" notation, use axis[].set_...
axis[1].set_xlim(0,max(time))
axis[1].set_ylim(0,max(position))
axis[1].set_title(f'dt = {tb} - {ta}')

# -------------------------- Velocity with dt = 0.1 -------------------------
dt = 0.01
tb = ta + dt

xa = position_eq(ta)
xb = position_eq(tb)

v = (xb - xa) / (tb - ta)
velocity_eq = lambda t: v*(t-ta) + xa
velocity = velocity_eq(time)

# Generate "plt" object using plot() method, and add title.
axis[2].plot(time, position,'b-',linewidth=1)
axis[2].plot(time, velocity,'r--',linewidth=1)
axis[2].plot(ta, xa,'rs',fillstyle='none',markersize=12)
axis[2].plot(tb, xb,'ro',fillstyle='none',markersize=10)

# Set limits for axis. If not using "plt.xlim(...)" notation, use axis[].set_...
axis[2].set_xlim(0,max(time))
axis[2].set_ylim(0,max(position))
axis[2].set_title(f'dt = {tb} - {ta}')

# Save figure
save_path = os.path.dirname(os.path.abspath(__file__)) + '/img/'

if not os.path.isdir(save_path):
    os.mkdir(save_path)

plt.savefig(save_path + 'fig_derivative.png')

# Combine all the operations and display
plt.show()
