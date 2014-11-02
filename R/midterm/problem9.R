library(ISLR)
library(boot)
#print(summary(Default))

attach(Default)
# Part a)
glm_info = glm(default ~ balance + income, data = Default, family=binomial)
#print(summary(glm_info))

# Part b)
boot.fn=function(dat,index){
    return(coef(glm(default ~ balance + income, data = dat, subset=index, family=binomial)))
}

#print(boot.fn(Default, 1:1000))

#print(boot.fn(Default,sample(392,392,replace=T)))
# Part c)

set.seed(1)
print(boot(Default, boot.fn, 1000))


#print(summary(Default))
