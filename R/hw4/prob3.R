# For homework 4 problem 4
library(MASS)
library(boot)

attach(Boston)
# Part a)
cat("Part a)\nmean = ")
medv_mean = mean(medv)
print(medv_mean)

# Part b)
cat("Part b)\nStandard error =")
medv_stderr = sd(medv/sqrt(length(medv)))
print(medv_stderr)

# Part c)
cat("Part c) bootstrap output:")
boot_fn=function (data ,index){
    return(mean(data[index]))
}

bootstrap = boot(medv, boot_fn, 1000)
print(bootstrap)

# Part d)
cat("Part d)\n")
cat("My estimated confidence interval:\n")
conf_interval = c(medv_mean - 2*0.4088, medv_mean + 2*0.4088)
print(conf_interval)
print(t.test(medv))
