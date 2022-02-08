'''
Plot the velocity of a car whose position is
x(t) = t^3

Let's use loops...
'''

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
dt_array = [1.0, 0.5, 0.01]

# Position for ta:
xa = position_eq(ta)

for idx,dt in enumerate(dt_array):
    tb = ta + dt
    xb = position_eq(tb)
    v = (xb - xa) / (tb - ta)
    
    # Another way to use a lambda function: skip the name definition
    velocity = (lambda t: v*(t-ta) + xa)(time)

    # Generate "plt" object using plot() method, and add title.
    axis[idx].plot(time, position,'b-',linewidth=1)
    axis[idx].plot(time, velocity,'r--',linewidth=1)
    axis[idx].plot(ta, xa,'rs',fillstyle='none',markersize=12)
    axis[idx].plot(tb, xb,'ro',fillstyle='none',markersize=10)
    
    # Set limits for axis. If not using "plt.xlim(...)" notation, use axis[].set_...
    axis[idx].set_xlim(0,max(time))
    axis[idx].set_ylim(0,max(position))
    axis[idx].set_title(f'dt = {tb} - {ta}')