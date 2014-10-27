library(ISLR)
names(Auto)
dim(Auto)
summary(Auto)
cor(Auto[, -9])
attach(Auto)

mpg01 = rep(0, length(mpg))
mpg01
median(mpg)
for (i in 1:length(mpg)){
    if (mpg[i] > median(mpg)){
#        cat("higher\n", mpg[i], "\n")
        mpg01[i] <- 1
    }else{
#        cat("lower\n", mpg[i], "\n")
        mpg01[i] <- 0
    }
}
mpg_auto = data.frame(Auto, mpg01)

#pairs(mpg_auto)

    

#pdf("mpgvhp.pdf")
#plot(mpg, horsepower)
#dev.off()
#pdf("mpgvcylinders.pdf")
#plot(mpg, cylinders)
#dev.off()

train <- vector()
test <- vector()
for (j in 1:length(year)){
    if(j %% 4 == 0){
        test <- append(test, year[j])
        #cat("train")
    }else{
        #cat("test")
        train <- append(train, year[j])
    }
}
cat("train = ", train, "\n")
cat("test = ", test, "\n")
