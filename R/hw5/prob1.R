# Problem One is Chapter 6 problem 8 in the book
library(leaps)

# Part a
set.seed(1)
X = rnorm(100)
e = rnorm(100)

# Part b
Y = 4 + 2*X + 4*X^2 + 8*X^3 + e
print(Y)

# Part c
xydata = data.frame(y = Y, x = X)
regfit_full = regsubsets(y ~ poly(x, 10, raw=T), data = xydata, nvmax = 10) 
reg_summary = summary(regfit_full)
cat("Bic = ")
print(which.min(reg_summary$bic))
cat("cp = ")
print(which.min(reg_summary$cp))
cat("rsq = ")
print(which.max(reg_summary$adjr2))

pdf("Adjr2.pdf")
plot(reg_summary$adjr2, xlab = "Number of Variables", ylab = "Adjusted RSq", type = "l")
points (4, reg_summary$adjr2[4], col="red", cex=2, pch =20)
dev.off()


pdf("bic.pdf")
plot(reg_summary$bic, xlab = "Number of Variables", ylab = "bic", type = "l")
points (4, reg_summary$bic[3], col="red", cex=2, pch =20)
dev.off()


pdf("cp.pdf")
plot(reg_summary$cp, xlab = "Number of Variables", ylab = "CP", type = "l")
points (4, reg_summary$cp[4], col="red", cex=2, pch =20)
dev.off()
