
par(mfrow=c(1,2))
x <- rnorm(50)
y <- 2+3*x + rnorm(50)
plot(x,y, main= "Changing titles and lables", sub="extra subtitle goes here", xlab="Index of observation", ylab="Observation", xlim=c(-2,2), ylim=c(-2, 2))
plot(x,y)
abline(lm(y ~ x), col = 'green')
points(x,y)
# need to add arrow to point to center, make sure points() is correct
arrows(1,-3,mean(x),mean(y), col = "red")
