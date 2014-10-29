# Need ginv() from MASS
library(MASS)
# read in raw data from csv
raw_data = read.csv('prob2.csv', header = T)
# fit raw data into a matrix
data_matrix = as.matrix(raw_data)
cat("data matrix:\n")
print(data_matrix)
# Extract the x columns from raw matrix
x_matrix = data_matrix[,c(1,2,3)]
x_matrix <- cbind(c(1,1,1,1,1), x_matrix)
cat("x matrix:\n")
print(x_matrix)
# extract the y vector from raw matrix
y = data_matrix[,4]
cat("y vector:\n")
print(y)
# transpose matrix
x_matrix_t = t(x_matrix)
cat("x matrix transposed\n")
print(x_matrix_t)

# compute matrix x * matrix x transposed
x_t_matrix = x_matrix_t %*% x_matrix
cat("x matrix * x matrix transposed\n")
print(x_t_matrix)

# compute the inverse of the x matrix * x matrix transpose
inv_x_t_matrix = ginv(x_t_matrix)
cat("inverse matrix = \n")
print(inv_x_t_matrix)
# compute w 
w = (inv_x_t_matrix) %*% (x_matrix_t) %*% y
cat("w = \n")
print(w)
