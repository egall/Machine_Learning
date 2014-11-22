# Problem 2
library(leaps)

# Part a
cat("Part a \n")
# Genereate a nxp matrix where n = 1000 and p = 20
X = matrix(rnorm(1000*20), 1000, 20)
beta_vec = rnorm(20)
beta_vec[2] = 0
beta_vec[4] = 0
beta_vec[9] = 0
beta_vec[12] = 0
beta_vec[15] = 0
e = rnorm(20)
Y = X %*% beta_vec + e
#print(Y)

# Part b
cat("Part b \n")
train = sample(seq(1000), 100, rep=FALSE)
#trainx = X[sample(seq(1000), 100, rep=FALSE), ]
#testx = X[sample(seq(1000), 100, rep=FALSE), ]
trainy = Y[train, ]
testy = Y[-train, ]

trainx = X[train, ]
testx = X[-train, ]

# Part c 
cat("Part c \n")
xydata = data.frame(y = trainy, x = trainx)
regfit_fill = regsubsets(y ~ ., data = xydata, nvmax = 20)
val_errors = rep(NA, 20)

train_mat=model.matrix(y ~ ., data=xydata, nvmax = 20)
for(i in 1:20){
    coefi = coef(regfit_fill, id=i)
    pred=train_mat[,names(coefi)]%*%coefi
    val_errors[i] = mean((trainy - pred)^2)
}
print(val_errors)
pdf("trainingmse.pdf")
plot(val_errors, ylab = "Training MSE", pch = 20)
dev.off()

# Part d
cat("Part d \n")
xydatatest = data.frame(y = testy, x = testx)
test_mat=model.matrix(y ~ ., data=xydatatest, nvmax = 20)
for(i in 1:20){
    coefi = coef(regfit_fill, id=i)
    pred=test_mat[,names(coefi)]%*%coefi
    val_errors[i] = mean((testy - pred)^2)
}
print(val_errors)
pdf("testmse.pdf")
plot(val_errors, ylab = "test MSE", pch = 20)
dev.off()

# Part e
cat("Part e \n")
print(which.min(val_errors))

# Part f
cat("Part f \n")
print(beta_vec)
print(coef(regfit_fill, id = 15))
