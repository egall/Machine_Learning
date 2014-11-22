# Problem 3

library(MASS)
library(ISLR)
library(boot)
library(splines)

# Part a
cat("Part a\n")
lm_fit = lm(nox~poly(dis, 3), data = Boston)
print(summary(lm_fit))

pdf("prob3a.pdf")
plot(lm_fit)
dev.off()


# Part b
cat("Part b\n")
rss_array = rep(0, 10)
for( i in 1:10){
    lm_fit = lm(nox~poly(dis, i), data = Boston)
    rss_array[i] = sum(lm_fit$residuals^2)
}

cat("All of the RSS values: ")
print(rss_array)

# Part c
cat("Part c\n")
delta_array = rep(0, 10)
for( i in 1:10){
    glm_fit = glm(nox~poly(dis, i), data = Boston)
    delta_array[i] = cv.glm(Boston, glm_fit, K = 10)$delta[2]
}

pdf("Problem3d.pdf")
plot(1:10, delta_array, xlab = "Degree", ylab = "CV error", type = "l", pch = 20, 
    lwd = 2)
dev.off()


# Part d
cat("Part d\n")
spline_fit = lm(nox~bs(dis,df = 4, knots = c(3, 6, 9)), data = Boston) 
print(summary(spline_fit))


# Part e
cat("Part e\n")
cv_error_array = rep(NA,8)
for(i in 4:12){
    #spline_fit = lm(nox~bs(dis,df = i, knots = c(3, 6, 9)), data = Boston) 
    spline_fit = lm(nox~bs(dis,df = i), data = Boston) 
    cv_error_array[i-4] = sum(spline_fit$residuals^2)
}
print(cv_error_array)
