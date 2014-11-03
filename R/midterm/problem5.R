library(plyr)
# set variables as specified
age <- 18:29
height <- c(76.1,77,78.1,78.2,78.8,79.7,79.9,81.1,81.2,81.8,82.8,83.5)
cat("Age = ", age, "\n")
cat("height = ", height, "\n")

# Get mean height
meanheight = mean(height)
cat("mean of age = ", meanheight, "\n")
# Get mean age
meanage = mean(age)
cat("mean of height = ", meanage, "\n")
# Get variance of height
heightvar = var(height)
cat("variance of height = ", heightvar, "\n")

# Set new weight vector for age
weightv <- c(1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10, 1/11, 1/12)
cat("weights are", weightv, "\n")

# Get the modified version of age * by the weight vector
wage <- age*weightv
cat("weighted age = ", wage, "\n")

# Get new mean for weighted age
wagemean <- mean(wage)
# Get variance for weighted age
wagevar <- var(wage)
cat("weighted age mean =", wagemean, "\n")
cat("weighted age variance =", wagevar, "\n")

# Get difference of age and height
ageheightdf <- data.frame(age, height)
print(ageheightdf)

# Rename the columns of the age/height dataframe
newdf = rename(ageheightdf, c("age"="col1", "height"="col2"))
print(newdf)

# initialize empty vector to hold row names
rownvec <- vector()
# Set row names
for (i in 1:12){
    currow <- paste("row", i, sep="")
    print(currow)
    rownvec <- append(rownvec, currow)
}
print(rownvec)
# Set new row names using names created in for loop
rownames(newdf) <- rownvec
print(newdf)
