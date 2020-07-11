using ODE


# Definition of parameters
const a = 1.0
const b = 0.1
const c = 1.5
const d = 0.75


function diffeq(t,u)
    du = similar(u)
    # u1: rabbits
    # u2: foxes
    du[1] = a*u[1] - b*u[1]*u[2]
    du[2] = -c*u[2] + d*b*u[1]*u[2]
    
    return du

end

# Simulation time
const t = collect(range(0.0,stop=18.0,length=1000))


# Initial condition
u0 = zeros(2)
u0[1] = 10
u0[2] = 5


# Solve ODE
(sol_t,sol_u) = ode45(diffeq,u0,tpoints=:specified)


#= Visualization of Results

using PyPlot
plot(sol_t,sol_u)
show()

=#