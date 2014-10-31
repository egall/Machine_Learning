library(MASS)
attach(Boston)
#print(summary(Boston))
print(names(Boston))

# This should scale the crime in the suburbs by the z-score
#print(scale(Boston$crim, center=T, scale=T))

lda_crim <- lda(crim ~ lstat + medv + zn + rm + tax, data = Boston)
print(lda_crim)
#plot(lda_crim)

glm_crim <- glm(crim ~ lstat + medv + zn + rm + tax, data = Boston)
cat("glm = \n")
print(glm_crim)
#plot(glm_crim)

train <-1:400
test <-401:506

library(class)
train_X <- cbind(lstat, medv, zn, rm, tax)[train,]
test_X <- cbind(lstat, medv, zn, rm, tax)[!train,]
train_crim = crim[train]

set.seed(1)
knn_pred <- knn(train_X, test_X, train_crim, k=1)
print(table(knn_pred))


