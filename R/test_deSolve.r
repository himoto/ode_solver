library(deSolve)

diffeq <- function (t, state, f_params) {
    # State variables
    # ---------------
    # u: rabbits
    # v: foxes
    with(
        as.list(c(state, f_params)), {
            du = a*u - b*u*v
            dv = -c*v + d*b*u*v
            
            return(list(c(du, dv)))
        }
    )
}

f_params <- c(a = 1.0, b = 0.1, c = 1.5, d = 0.75)
state <- c(u = 10, v = 5)
t <- seq(0, 18, by = 0.01)

out <- as.data.frame(ode(func = diffeq, y = state, parms = f_params, times = t))

matplot(out[,-1], type = "l", xlab = "Time", ylab = "Population")
legend("topright", c("Rabbits", "Foxes"), lty = c(1,2), col = c(1,2), box.lwd = 0)