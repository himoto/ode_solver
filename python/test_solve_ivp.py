import numpy as np
from scipy.integrate import solve_ivp


# Definition of parameters
a = 1.0
b = 0.1
c = 1.5
d = 0.75


# Definition of the equations
def diffeq(t, y):
    dydt = [0] * 2
    """
    y[0] : rabbits
    y[1] : foxes
    """
    dydt[0] = a * y[0] - b * y[0] * y[1]
    dydt[1] = -c * y[1] + d * b * y[0] * y[1]

    return dydt


# Simulation time
t = (0, 18)

# Initial condition
y0 = [None] * 2
y0[0] = 10
y0[1] = 5

# Solve ODE
sol = solve_ivp(diffeq, t, y0)

"""
import matplotlib.pyplot as plt

plt.plot(sol.t, sol.y.T)
plt.show()
"""