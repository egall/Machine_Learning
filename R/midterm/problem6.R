library(ElemStatLearn)
library(gettingtothebottom)
data(ozone)

# Find dimensions of ozone
dimensions = dim(ElemStatLearn::ozone)
cat("ozone dimensions =", dimensions, "\n")

print(summary(ElemStatLearn::ozone))

# Model ozone
ozone_lm = lm(formula = ozone ~ ., data = ozone)
print(summary(ozone_lm))

# Take y value to use for gradient descent
#y <- ElemStatLearn::ozone

attach(ElemStatLearn::ozone)

# Take y value to use for gradient descent
y <- ozone[,1]
print(y)
# Create matrix with radiation, temp, and wind as columns
matrix <- cbind(1,radiation, temperature, wind)
print(matrix)
# Set theta to be zeros
theta <- c(0, 0, 0, 0)

m <- nrow(matrix)


# Set cost
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

# function used for gradient decent
f <- function(X, y, b) {
    (1/2) * norm(y - X %*% b, "F")^2
}
grad_f <- function(X, y, b) {
    t(X) %*% (X %*% b - y)
}  

# Take gradient decent
grad_decent <- gdescent(f, grad_f, matrix, y, 0.001, 100000) 
print(summary(grad_decent))

