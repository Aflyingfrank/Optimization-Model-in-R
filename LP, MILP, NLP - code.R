### Linear Programming (LP) ###
library(lpSolve)

# Min 3x1 + 2x2
f.obj <- c(3, 2)

# Constraints:
# x1 + x2 >= 4  → multiply by -1 to convert to <=
# x1 >= 1       → same trick
f.con <- rbind(
  c(-1, -1),
  c(-1,  0)
)

f.dir <- c("<=", "<=")
f.rhs <- c(-4, -1)

result <- lp("min", f.obj, f.con, f.dir, f.rhs)
result$solution
result$objval

### Mixed Integer Linear Programming (MILP) ###
library(lpSolve)

# Variables: x1, x2, y1, y2
obj <- c(6, 4, -60, -40)

f.con <- matrix(c(
  1, 1, 0, 0,
  1, 0, -20, 0,
  0, 1, 0, -20
), nrow = 3, byrow = TRUE)

f.dir <- c("<=", "<=", "<=")
f.rhs <- c(20, 0, 0)

res <- lp("max", obj, f.con, f.dir, f.rhs,
          binary.vec = c(3,4))

res$objval
res$solution

### Non-linear Programming (NLP) ###
obj <- function(x){
  y <- 10 - x
  2*x + 3*y + (x^2 + y^2)/10
}

res <- optim(par = 5, fn = obj, method = "L-BFGS-B",
             lower = 0, upper = 10)

res$par          # optimal x
10 - res$par     # optimal y
res$value        # objective value






