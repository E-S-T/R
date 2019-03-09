# RMS2 lab 11 - linear regression

#EXAMPLE 1
salary = read.csv("C:/Users/Esther/Downloads/salary.csv")
library(psych)
#get basic info
head(salary)
describe(salary)

#visualise data
pairs.panels(salary)
#can assess homogeneity and linearity here

results <- lm(salary$income ~ salary$YearsEd)
summary(results)
#significant result. years of education does increase income


#EXAMPLE 2
reg_data <- data.frame(growth=c(12,10,8,11,6,7,2,3,3), tannin=c(0,1,2,3,4,5,6,7,8))
reg_data
#run linear model
model1 <- lm(reg_data$growth ~ reg_data$tannin)
model1
summary(model1)
#so there is a significant relationship between tannin and growth
plot(x=reg_data$tannin, y=reg_data$growth)
abline(model1, col="red")

#can see attributes of model
attributes(model1)
model1$residuals
attributes((summary(model1)))
#can find the proportion of variance accounted for by the model
summary(model1)$r.squared
#80% of var accounted for is pretty good


#EXAMPLE 3
group <- gl(2,12,labels = c("picture", "real spider"))
anxiety <- c(30,35,40,45,50,35,55,25,30,45,40,50,40,35,50,55,65,55,55,35,30,50,60,39)
spiderLong <- data.frame(group, anxiety)
#calculate mean anxiety for picture group
meanpicture <- mean(spiderLong[group=="picture", "anxiety"])
meanpicture
#calculate mean anxiety for real spider group
meanspider <- mean(spiderLong[group=="real spider", "anxiety"])
meanspider

#run model
spiderlm <- lm(spiderLong$anxiety ~ spiderLong$group)
spiderlm
summary(spiderlm)
#so the difference is not significant
#can run a t-test to be sure
t.test(anxiety ~ group, data = spiderLong, paired = F, var.equal = T, conf.level = 0.95)
#also not significant