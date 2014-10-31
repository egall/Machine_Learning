library(ElemStatLearn)
library(gettingtothebottom)
data(ozone)

dimensions = dim(ElemStatLearn::ozone)
cat("ozone dimensions =", dimensions, "\n")

print(summary(ElemStatLearn::ozone))

ozone_lm = lm(formula = ozone ~ ., data = ozone)
print(summary(ozone_lm))

y <- ElemStatLearn::ozone

attach(ElemStatLearn::ozone)
cat("radiation = \n")
print(radiation)
print(temperature)
print(wind)

y <- ozone[,1]
print(y)
matrix <- cbind(1,radiation, temperature, wind)
print(matrix)
theta <- c(0, 0, 0, 0)

m <- nrow(matrix)


cost <- sum(((matrix%*%theta)- y)^2)/(2*m)
print(cost)

# Set learning parameter 
alpha <- 0.001

#Number of iterations 
iterations <- 1500

# updating thetas using gradient update 
for(i in 1:iterations){ 
    theta[1] <- theta[1] - alpha * (1/m) * sum(((matrix%*%theta)- y)) 
    theta[2] <- theta[2] - alpha * (1/m) * sum(((matrix%*%theta)- y)*matrix[,2]) 
}

print(theta)

print(matrix)

f <- function(X, y, b) {
    (1/2) * norm(y - X %*% b, "F")^2
}
grad_f <- function(X, y, b) {
    t(X) %*% (X %*% b - y)
}  

plzwork <- gdescent(f, grad_f, matrix, y, 0.001, 100000) 
print(summary(plzwork))

