using Sundials


# Definition of parameters
const a = 1.0
const b = 0.1
const c = 1.5
const d = 0.75


function diffeq(du,u,p,t)
    # u1: rabbits
    # u2: foxes
    du[1] = a*u[1] - b*u[1]*u[2]
    du[2] = -c*u[2] + d*b*u[1]*u[2]

end

# Simulation time
const tspan = (0.0,18.0)


# Initial condition
u0 = zeros(2)
u0[1] = 10
u0[2] = 5


# Solve ODE
prob = ODEProblem(diffeq,u0,tspan)
sol = solve(prob,CVODE_BDF(),saveat=(tspan[end]-tspan[1])/999)


#= Visualization of Results

using PyPlot
plot(sol.t,sol.u)
show()

=#