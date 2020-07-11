import numpy as np
from scipy.integrate import ode


# Function: solveode
def solveode(diffeq, y0, tspan):
    sol = ode(diffeq)
    sol.set_integrator('dopri5')
    sol.set_initial_value(y0, tspan[0])
    T = [tspan[0]]
    Y = [y0]
    while sol.successful() and sol.t < tspan[-1]:
        sol.integrate(tspan[-1])
        T.append(sol.t)
        Y.append(sol.y)

    return np.array(T), np.array(Y)


# Definition of parameters
a = 1.0
b = 0.1
c = 1.5
d = 0.75


# Definition of the equations
def diffeq(t, y):
    dydt = [0] * 2

    dydt[0] = a*y[0] - b*y[0]*y[1]
    dydt[1] = -c*y[1] + d*b*y[0]*y[1]

    return dydt


# Simulation time
t = np.linspace(0,18,1000)

# Initial condition
y0 = [None] * 2
y0[0] = 10
y0[1] = 5

# Solve ODE
Y = solveode(diffeq, y0, t)