library(diffeqr)
diffeqr::diffeq_setup()

f <- function (u, p, t) {
    # State variables
    # ---------------
    # u1: rabbits
    # u2: foxes
    du1 = p[1]*u[1] - p[2]*u[1]*u[2]
    du2 = -p[3]*u[2] + p[4]*p[2]*u[1]*u[2]
    
    return(c(du1, du2))
}

u0 = c(10, 5)
tspan <- list(0.0, 18.0)
p = c(1.0, 0.1, 1.5, 0.75)
sol = diffeqr::ode.solve(f, u0, tspan, p=p, saveat=0.01)

udf = as.data.frame(sol$u)
matplot(sol$t, udf, type = "l", xlab = "Time", ylab = "Population")
legend("topright", c("Rabbits", "Foxes"), lty = c(1,2), col = c(1,2), box.lwd = 0)