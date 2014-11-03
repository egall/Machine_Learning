library(MASS)
attach(Boston)
#print(summary(Boston))
#print(names(Boston))

# This should scale the crime in the suburbs by the z-score
#print(scale(Boston$crim, center=T, scale=T))


# Plot logistic regression
glm_crim <- glm(crim ~ lstat + medv + zn + rm + tax, data = Boston)
#cat("glm = \n")
#print(summary(glm_crim))

# mean = 3.613524
mean(crim)
# start with all lower
glm_pred = rep("Lower", 506)
# change to 'higher" if over 3.61
glm_pred[crim > 3.6135] = "Higher"
# take sume of suberbs that have higher crime rate than the median
print(sum(glm_pred == "Higher"))
# got sum == 128
# This prints lower if a neighborhood has lower crime than
# the mean, and higher, if the value is higher, not sure
# how to print which neighborhood it's refering to.
#print(glm_pred)

#plot(glm_crim)

train <-1:400
test <-401:506
all <- 1:506
train_X <- Boston[train, c(-3, -10, -9, -1)]
test_X <- Boston[test, c(-3, -10, -9, -1)]
all_X <- Boston[all,  c(-3, -10, -9, -1)]


# Linear regression
lda_crim <- lda(crim ~ lstat + medv + zn + rm + tax, data = Boston, subset = train)
#print(summary(lda_crim))

lda_pred <- predict(lda_crim, all_X)
#print(lda_pred)
# Mean is 0.002506266
mean(lda_pred$posterior)
# take sum of that 
sum(lda_pred$posterior[,1]>=0.002506266)
# We get 198 of these suberbs have a crime rate above the median



#
library(class)
train_crim = crim[train]

set.seed(1)
knn_pred <- knn(train_X, test_X, train_crim, k=3)

print(table(knn_pred))
# take mean get 0.2656
mean(table(knn_pred))
# take sum of values greater than 0.2656
sum(table(knn_pred) > 0.2656642)
# gives 61




