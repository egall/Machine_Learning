college <- read.csv(file="College.csv",head=TRUE,sep=",")

attach(college)
fix(college)
rownames (college ) <- college [,1] 
college <- college [,-1]
fix(college)
summary(college)

plot(college)
pairs(college[,1:10])
boxplot(college[,"Outstate",], college[,"Private"])

Elite = rep("No", nrow(college))
Elite [college$Top10prec > 50] = "Yes"
Elite = as.factor(Elite)
college = data.frame(college, Elite)
summary(college)
boxplot(college[,"Outstate",], college[,"Private"])

par(mfrow=c(2,2))
hist(P.Undergrad)
hist(F.Undergrad)
hist(Top25perc)
hist(perc.alumni)

#plot(P.Undergrad, F.Undergrad)
#plot(Accept, Top10perc)
#plot(Top10perc, Grad.Rate)
#plot(Accept, Expend)

