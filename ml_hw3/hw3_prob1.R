a <- c(0.1, 0.2, 0.1, 0.0, 0.1, 0.1, 0.2, 0.3, 0.1, 0.2)
b <- c(0.2, 0.2, 0.1, 0.1, 0.2, 0.3, 0.2, 0.2, 0.2, 0.2)

diff <- b-a
cat("diff =", diff, "\n")

meana <- mean(a)
meanb <- mean(b)

sda <- sd(a)
sdb <- sd(b)
sddiff <- sd(diff)

cat("standard deviation of a = ", sda, "standard deviation of b = ", sdb, "standard deviation of diff = ", sddiff, "\n")

cat("mean of a =", meana, "mean of b =", meanb, "\n")

meandiff <- meanb-meana



cat("difference of means = ", meandiff, "\n")

print(t.test(b, a, mu = meandiff, paired=T, alternative="greater"))


#t_test = t.test(b, a, mu = meandiff, paired=T, alternative="greater")
#t_test = t.test(b, a, paired=T)
t_test = t.test(b, a, paired=T, alternative="greater")

print(names(t_test))

# print out the t-statistic
print(t_test$statistic)
