a <- c(0.1, 0.2, 0.1, 0.0, 0.1, 0.1, 0.2, 0.3, 0.1, 0.2)
b <- c(0.2, 0.2, 0.1, 0.1, 0.2, 0.3, 0.2, 0.2, 0.2, 0.2)

diff <- b-a
cat("diff =", diff, "\n")

meana <- mean(a)
meanb <- mean(b)

cat("mean of a =", meana, "mean of b =", meanb, "\n")

meandiff <- meanb-meana

cat("difference of means = ", meandiff, "\n")

print(t.test(b, a, mu = 0, paired=T, alternative="greater"))
