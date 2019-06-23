using ODE;


# name2idx
const rabbit = 1;
const fox = 2;


# Definition of parameters
const a = 1.0;
const b = 0.1;
const c = 1.5;
const d = 0.75;


function diffeq(t,u)
    
    du = similar(u);

    du[rabbit] = a*u[rabbit] - b*u[rabbit]*u[fox];
    du[fox] = -c*u[fox] + d*b*u[rabbit]*u[fox];
    
    return du

end

# Simulation time
const t = collect(range(0.0,stop=18.0,length=1000));


# Initial condition
u0 = zeros(2);
u0[rabbit] = 10;
u0[fox] = 5;


# Solve ODE
(sol_t,sol_u) = ode45(diffeq,u0,t;points=:specified);


#= Visualization of Results

using PyPlot;
plot(sol_t,sol_u);
show();

=#