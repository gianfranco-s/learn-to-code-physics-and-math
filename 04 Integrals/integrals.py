'''
Integrate f(x) = 1 + x^2 for x in [0,5]
'''
import sympy as sy
import numpy as np
import matplotlib.pyplot as plt

x1 = 0
x2 = 5

# Calculate the symbolic integral
x = sy.symbols('x', real = True)
f_sym = 1 + x**2
f_sym_total = sy.integrate(f_sym,(x,x1,x2)).evalf()
print(f_sym_total)


# Calculate numerical integral. We'll try a few methods



# Riemann's sum as an approximaton for the integral:
N = 4           # Number of sums to be performed. Note that for larger values of N, the sum total approaches its true value.

f_eq = lambda x: 1 + x**2
x_orig = np.linspace(x1,x2,1000)
f_orig = f_eq(x_orig)  # Evaluates the original function considering a continuous variable. This is only to plot the function.

x = np.linspace(x1,x2,N+1)
dx = x[1] - x[0]

# ------------------- Midpoint approximation -------------------
# Xeval[i] = ( X[i] + X[i+1] ) / 2
Xmed = np.empty(N)
for i in range(1,N):
    Xmed[i] = ( x[i] + x[i+1] ) / 2

fmed = f_eq(Xmed)
Smed = np.sum(fmed)*dx

print()
print('Midpoint approximation')
print(Smed)

# ------------------- Left Side approximation -------------------
#  Xeval[i] = X[i]

Xlft = np.empty(N)
for i in range(1,N):
    Xlft[i] = x[i]

flft = f_eq(Xlft)
Slft = np.sum(flft)*dx

print()
print('Left side approximation')
print(Slft)


# ------------------- Trapezoid approximation -------------------
# ftra = ( f(i+1) + f(i) ) / 2
Xtra = Xtra = x[:-1]
ftra = np.empty(N)
fx = f_eq(x)

for i in range(1,N):
    ftra[i] = ( fx[i+1] + fx[i] ) / 2

Stra = np.sum(ftra)*dx

print()
print('Trapezoid approximation')
print(Stra)


# ----------------- Plots -------------------
# figure, axis = plt.subplots(1, 3)

method = ['Midpoint', 'Left side', 'Trapezoid']


plt.plot(x_orig, f_orig,'b-',linewidth=1)
# axis[idx].plot(time, velocity,'r--',linewidth=1)
# axis[idx].plot(ta, xa,'rs',fillstyle='none',markersize=12)
# axis[idx].plot(tb, xb,'ro',fillstyle='none',markersize=10)


# axis[idx].set_xlim(0,max(time))
# axis[idx].set_ylim(0,max(position))
# axis[idx].set_title(f'dt = {tb} - {ta}')
plt.show()

# TO DO: plot the rectangles!