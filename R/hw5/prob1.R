# Problem One is Chapter 6 problem 8 in the book
library(leaps)

# Part a
X = rnorm(100)
e = rnorm(100)

# Part b
Y = 4 + 2*X + 4*X^2 + 8*X^3 + e
print(Y)

# Part c
#regfit_full = regsubsets(
