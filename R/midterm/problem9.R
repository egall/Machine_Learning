library(ISLR)
#print(summary(Default))

attach(Default)

glm_info = glm(default ~ balance + income, data = Default, family=binomial)
#print(summary(glm_info))

print(summary(Default))
