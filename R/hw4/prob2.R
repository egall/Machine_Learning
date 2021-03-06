# This is for problem2 of homework 4
library(boot)
cat("Part a)\n")
# Part a)
set.seed(1)
y=rnorm(100)
x=rnorm(100)
y=x-2*x^2+rnorm(100)

cat("Part b)\n")
# Part b)
pdf("problem2b.pdf")
plot(x,y)
dev.off()

cat("Part c)\n")
# Part c)
set.seed(1)
xydataf = data.frame(x, y)
# i)
glm_fit1 = glm(y ~ x)
cv_err1 = cv.glm(xydataf, glm_fit1)
cat("cv error for 1 = ")
print(cv_err1$delta)
cat("\n")

# ii)
glm_fit2 = glm(y ~ poly(x, 2))
cv_err2 = cv.glm(xydataf, glm_fit2)
cat("cv error for 2 = ")
print(cv_err2$delta)
cat("\n")

# iii)
glm_fit3 = glm(y ~ poly(x, 3))
cv_err3 = cv.glm(xydataf, glm_fit3)
cat("cv error for 3 = ")
print(cv_err3$delta)
cat("\n")

# iv)
glm_fit4 = glm(y ~ poly(x, 4))
cv_err4 = cv.glm(xydataf, glm_fit4)
cat("cv error for 4 = ")
print(cv_err4$delta)
cat("\n")

# Part d)
cat("Part d)\n")
set.seed(1)
xydataf = data.frame(x, y)
# i)
glm_fit1 = glm(y ~ x)
cv_err1 = cv.glm(xydataf, glm_fit1)
cat("cv error for 1 = ")
print(cv_err1$delta)
cat("\n")

# ii)
glm_fit2 = glm(y ~ poly(x, 2))
cv_err2 = cv.glm(xydataf, glm_fit2)
cat("cv error for 2 = ")
print(cv_err2$delta)
cat("\n")

# iii)
glm_fit3 = glm(y ~ poly(x, 3))
cv_err3 = cv.glm(xydataf, glm_fit3)
cat("cv error for 3 = ")
print(cv_err3$delta)
cat("\n")

# iv)
glm_fit4 = glm(y ~ poly(x, 4))
cv_err4 = cv.glm(xydataf, glm_fit4)
cat("cv error for 4 = ")
print(cv_err4$delta)
cat("\n")


# Part f)
cat("Part f\n")
print(summary(glm_fit4))
