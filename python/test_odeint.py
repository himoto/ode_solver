import numpy as np
from scipy.integrate import odeint


# name2idx
rabbit = 0
fox = 1


# Definition of parameters
a = 1.0
b = 0.1
c = 1.5
d = 0.75


# Definition of the equations
def diffeq(y,t):
    dydt = [0]*2

    dydt[rabbit] = a*y[rabbit] - b*y[rabbit]*y[fox]
    dydt[fox] = -c*y[fox] + d*b*y[rabbit]*y[fox]

    return dydt


# Simulation time
t = np.linspace(0,18,1000)

# Initial condition
y0 = [None]*2
y0[rabbit] = 10
y0[fox] = 5

# Solve ODE
Y = odeint(diffeq,y0,t)