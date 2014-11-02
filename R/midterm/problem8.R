# Note: Uncomment the print statments to see the results for each section
library(ISLR)
#print(summary(Default))

attach(Default)

# Part a)
glm_info = glm(default ~ balance + income, data = Default, family=binomial)
#print(summary(glm_info))

# Part b)
# i) Create training set, will be 8000 train, 2000 test/validation
train_X <- 1:8000
test_X <- 8001:10000

train = Default[train_X,]
# ii) Do training
glm_info_train = glm(default ~ balance + income, data = Default, family=binomial, subset=train_X)
#print(summary(glm_info_train))
# iii) Do prediction and print 
glm_probs <- predict(glm_info_train)
#print(glm_probs)
glm_pred = rep("No", 8000)
prediction = glm_pred[glm_probs > 0.5] = "Yes"
#training_error = mean(glm_pred == "No")

# This prints as "yes"
#print(prediction)

# iv)
glm_info_test = glm(default ~ balance + income, data = Default, family=binomial, subset=test_X)
glm_probs_test <- predict(glm_info_test)
glm_pred_test = rep("No", 8000)
prediction = glm_pred[glm_probs_test > 0.5] = "Yes"
test_error = mean(glm_pred == "No")
print(test_error)



# Part c
# i) Create training set, will be 5000 train, 5000 test/validation

##############  Run 1 #########
train_X <- 1:5000
test_X <- 5001:10000

train = Default[train_X,]
# ii) Do training
glm_info_train = glm(default ~ balance + income, data = Default, family=binomial, subset=train_X)
#print(summary(glm_info_train))
# iii) Do prediction and print 
glm_probs <- predict(glm_info_train)
#print(glm_probs)
glm_pred = rep("No", 8000)
prediction = glm_pred[glm_probs > 0.5] = "Yes"
#training_error = mean(glm_pred == "No")

# This prints as "yes"
#print(prediction)

# iv)
glm_info_test = glm(default ~ balance + income, data = Default, family=binomial, subset=test_X)
glm_probs_test <- predict(glm_info_test)
glm_pred_test = rep("No", 8000)
prediction = glm_pred[glm_probs_test > 0.5] = "Yes"
test_error = mean(glm_pred == "No")
print(test_error)

######### Run 2  ##################
# i) Create training set, will be 2000 train, 8000 test/validation
train_X <- 1:2000
test_X <- 2001:10000

train = Default[train_X,]
# ii) Do training
glm_info_train = glm(default ~ balance + income, data = Default, family=binomial, subset=train_X)
#print(summary(glm_info_train))
# iii) Do prediction and print 
glm_probs <- predict(glm_info_train)
#print(glm_probs)
glm_pred = rep("No", 8000)
prediction = glm_pred[glm_probs > 0.5] = "Yes"
#training_error = mean(glm_pred == "No")

# This prints as "yes"
#print(prediction)

# iv)
glm_info_test = glm(default ~ balance + income, data = Default, family=binomial, subset=test_X)
glm_probs_test <- predict(glm_info_test)
glm_pred_test = rep("No", 8000)
prediction = glm_pred[glm_probs_test > 0.5] = "Yes"
test_error = mean(glm_pred == "No")
print(test_error)


############ Run 3 ############ 
# i) Create training set, will be 1000 train, 9000 test/validation
train_X <- 1:2000
test_X <- 2001:10000

train = Default[train_X,]
# ii) Do training
glm_info_train = glm(default ~ balance + income, data = Default, family=binomial, subset=train_X)
#print(summary(glm_info_train))
# iii) Do prediction and print 
glm_probs <- predict(glm_info_train)
#print(glm_probs)
glm_pred = rep("No", 8000)
prediction = glm_pred[glm_probs > 0.5] = "Yes"
#training_error = mean(glm_pred == "No")

# This prints as "yes"
#print(prediction)

# iv)
glm_info_test = glm(default ~ balance + income, data = Default, family=binomial, subset=test_X)
glm_probs_test <- predict(glm_info_test)
glm_pred_test = rep("No", 8000)
prediction = glm_pred[glm_probs_test > 0.5] = "Yes"
test_error = mean(glm_pred == "No")
print(test_error)



# Part d)
# i) Create training set, will be 8000 train, 2000 test/validation
train_X <- 1:8000
test_X <- 8001:10000

train = Default[train_X,]
# ii) Do training
glm_info_train = glm(default ~ balance + income + student, data = Default, family=binomial, subset=train_X)
#print(summary(glm_info_train))
# iii) Do prediction and print 
glm_probs <- predict(glm_info_train)
#print(glm_probs)
glm_pred = rep("No", 8000)
prediction = glm_pred[glm_probs > 0.5] = "Yes"
#training_error = mean(glm_pred == "No")

# This prints as "yes"
#print(prediction)

# iv)
glm_info_test = glm(default ~ balance + income, data = Default, family=binomial, subset=test_X)
glm_probs_test <- predict(glm_info_test)
glm_pred_test = rep("No", 8000)
prediction = glm_pred[glm_probs_test > 0.5] = "Yes"
test_error = mean(glm_pred == "No")
print(test_error)


#glm_probs = predict(glm_info_train, test_X, type="repsonse")
