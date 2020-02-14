using SciPyDiffEq;


# name2idx
const rabbit = 1;
const fox = 2;


# Definition of parameters
const a = 1.0;
const b = 0.1;
const c = 1.5;
const d = 0.75;


function diffeq(u,p,t)
    du = zeros(2)
    
    du[rabbit] = a*u[rabbit] - b*u[rabbit]*u[fox]
    du[fox] = -c*u[fox] + d*b*u[rabbit]*u[fox]
    
    return du

end

# Simulation time
const tspan = (0.0,18.0);


# Initial condition
u0 = zeros(2);
u0[rabbit] = 10;
u0[fox] = 5;


# Solve ODE
prob = ODEProblem(diffeq,u0,tspan);
sol = solve(prob,SciPyDiffEq.BDF(),saveat=(tspan[end]-tspan[1])/999);


#= Visualization of Results
using PyPlot
figure(figsize=(20,8));
plot(sol.t,sol.u);
show()
=#