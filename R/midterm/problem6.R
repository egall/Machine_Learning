library(plyr)
age <- 18:29
height <- c(76.1,77,78.1,78.2,78.8,79.7,79.9,81.1,81.2,81.8,82.8,83.5)
cat("Age = ", age, "\n")
cat("height = ", height, "\n")

meanheight = mean(height)
cat("mean of age = ", meanheight, "\n")
meanage = mean(age)
cat("mean of height = ", meanage, "\n")
heightvar = var(height)
cat("variance of height = ", heightvar, "\n")

weightv <- c(1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10, 1/11, 1/12)
cat("weights are", weightv, "\n")

wage <- age*weightv
cat("weighted age = ", wage, "\n")

wagemean <- mean(wage)
wagevar <- var(wage)
cat("weighted age mean =", wagemean, "\n")
cat("weighted age variance =", wagevar, "\n")

ageheightdf <- data.frame(age, height)
print(ageheightdf)

newdf = rename(ageheightdf, c("age"="col1", "height"="col2"))
print(newdf)

rownvec <- vector()
for (i in 1:12){
    currow <- paste("row", i, sep="")
    print(currow)
    rownvec <- append(rownvec, currow)
}
print(rownvec)
#rownames(newdf) <- c("row1", "row2", "row3", "row4", "row5", "row6", "row7", "row8", "row9", "row10", "row11", "row12") 
rownames(newdf) <- rownvec
print(newdf)
