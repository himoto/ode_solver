import numpy as np
from scipy.integrate import odeint


# Definition of parameters
a = 1.0
b = 0.1
c = 1.5
d = 0.75


# Definition of the equations
def diffeq(y, t):
    dydt = [0] * 2
    """
    u[0] : rabbits
    u[1] : foxes
    """
    dydt[0] = a*y[0] - b*y[0]*y[1]
    dydt[1] = -c*y[1] + d*b*y[0]*y[1]

    return dydt


# Simulation time
t = np.linspace(0,18,1000)

# Initial condition
y0 = [None]*2
y0[0] = 10
y0[1] = 5

# Solve ODE
Y = odeint(diffeq, y0, t)